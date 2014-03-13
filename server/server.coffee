Meteor.publish "allQuestions", ->
    Questions.find()

process.env.MAIL_URL = "smtp://postmaster@sandbox18028.mailgun.org:9q3nxrc3rs88@smtp.mailgun.org:587"

Meteor.methods
  sendEmail: (email) ->  
    # send the email!
    console.log email, 'email'
    Email.send
      to: email
      from: "info@anasuka.com"
      subject: "[ANASUKA] Congratulations!"
      text: "We will share with you some news about us in a near future. See you soon! Party on!"
