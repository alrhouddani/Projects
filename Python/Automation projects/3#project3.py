from cgitb import html
import smtplib
import ssl
from email.message import EmailMessage

subject = "Email from python"
body = " This is a test from python"
sender_email =  "nlpunions1@gmail.com"
receiver_email = "abdellahrhouddani@gmail.com"
password = input("Enter password: ")

message = EmailMessage()
message["from"] = sender_email
message["to"] = receiver_email
message["subject"] = subject
message.set_content(body)

context = ssl.create_default_context() 

print("send Email")
with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
    server.login(sender_email, password)
    server.sendmail(sender_email, receiver_email, message.as_string())
    

print("Email sent")
