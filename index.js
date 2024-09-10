const express = require('express');
const bodyParser = require('body-parser');
const sgMail = require('@sendgrid/mail');

const app = express();
const port = 3000;

// Set SendGrid API Key here
sgMail.setApiKey('##########');

app.use(bodyParser.json());

app.post('/send-email', async (req, res) => {
  const { message, subject, recipient } = req.body;

  try {
    const msg = {
      to: recipient,
      from: 'buisnessemail@com.com', // verified SendGrid sender email
      subject: subject,
      text: message,
    };
    await sgMail.send(msg);
    res.status(200).send('Email sent successfully');
  } catch (error) {
    console.error(error);
    res.status(500).send('Failed to send email');
  }
});

app.listen(port, () => {
  console.log(`Email service running at http://localhost:${port}`);
});
