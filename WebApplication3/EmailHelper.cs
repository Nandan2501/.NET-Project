using System;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace WebApplication3
{
    public static class EmailHelper
    {
        public static string Generate4DigitOtp()
        {
            byte[] bytes = new byte[4];
            using (var rng = System.Security.Cryptography.RandomNumberGenerator.Create())
            {
                rng.GetBytes(bytes);
            }
            int val = Math.Abs(BitConverter.ToInt32(bytes, 0)) % 9000 + 1000;
            return val.ToString();
        }

        public static bool SendOtpEmail(string toEmail, string recipientName, string otpCode, string purpose, out string errorMessage)
        {
            errorMessage = string.Empty;

            string host = DbHelper.GetAppSetting("SmtpHost", ConfigurationManager.AppSettings["SmtpHost"] ?? "smtp.gmail.com");
            string portStr = DbHelper.GetAppSetting("SmtpPort", ConfigurationManager.AppSettings["SmtpPort"] ?? "587");
            string smtpEmail = DbHelper.GetAppSetting("SmtpEmail", ConfigurationManager.AppSettings["SmtpEmail"] ?? "");
            string smtpPass = DbHelper.GetAppSetting("SmtpPassword", ConfigurationManager.AppSettings["SmtpPassword"] ?? "");
            string enableSslStr = DbHelper.GetAppSetting("SmtpEnableSsl", ConfigurationManager.AppSettings["SmtpEnableSsl"] ?? "true");
            string companyName = DbHelper.GetAppSetting("CompanyName", "Transpo");

            if (string.IsNullOrWhiteSpace(smtpEmail) || string.IsNullOrWhiteSpace(smtpPass))
            {
                errorMessage = "Email SMTP is not configured yet. Please set Gmail & App Password in Admin -> Settings (or Web.config).";
                return false;
            }

            int port = 587;
            int.TryParse(portStr, out port);
            bool enableSsl = !string.Equals(enableSslStr, "false", StringComparison.OrdinalIgnoreCase);

            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;

                using (var msg = new MailMessage())
                {
                    msg.From = new MailAddress(smtpEmail.Trim(), string.IsNullOrWhiteSpace(companyName) ? "Transpo" : companyName);
                    msg.To.Add(new MailAddress(toEmail.Trim()));
                    msg.Subject = $"{purpose} - Your OTP Code is {otpCode}";
                    msg.IsBodyHtml = true;
                    msg.Body = $@"
                        <div style='font-family:Segoe UI,Arial,sans-serif;max-width:520px;margin:0 auto;padding:24px;border:1px solid #e2e8f0;border-radius:10px;background:#ffffff;'>
                            <h2 style='color:#1d4ed8;margin-top:0;'>Transpo Verification</h2>
                            <p style='color:#334155;font-size:15px;'>Hello <strong>{System.Web.HttpUtility.HtmlEncode(recipientName)}</strong>,</p>
                            <p style='color:#334155;font-size:15px;'>Use the following 4-digit OTP code for <strong>{System.Web.HttpUtility.HtmlEncode(purpose)}</strong>:</p>
                            <div style='margin:20px 0;padding:16px;text-align:center;background:#eff6ff;border:1px dashed #2563eb;border-radius:8px;'>
                                <span style='font-size:32px;font-weight:800;letter-spacing:10px;color:#1e3a8a;'>{otpCode}</span>
                            </div>
                            <p style='color:#64748b;font-size:13px;'>This code expires in 15 minutes. If you did not request this, please ignore this email.</p>
                        </div>";

                    using (var client = new SmtpClient(host.Trim(), port))
                    {
                        client.EnableSsl = enableSsl;
                        client.DeliveryMethod = SmtpDeliveryMethod.Network;
                        client.UseDefaultCredentials = false;
                        client.Credentials = new NetworkCredential(smtpEmail.Trim(), smtpPass.Replace(" ", "").Trim());
                        client.Timeout = 15000;
                        client.Send(msg);
                    }
                }
                return true;
            }
            catch (Exception ex)
            {
                errorMessage = "Failed to send OTP email: " + ex.Message;
                return false;
            }
        }
    }
}
