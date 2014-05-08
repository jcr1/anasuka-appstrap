Meteor.publish "allQuestions", ->
  Questions.find()

Meteor.publish "allDatas", ->
  Datas.find()

process.env.MAIL_URL = "smtp://postmaster@sandbox18028.mailgun.org:9q3nxrc3rs88@smtp.mailgun.org:587"

Meteor.methods
  sendEmail: (email) ->  
    # send the email!
    console.log email, 'email'
    Email.send
      to: email
      from: "info@wealthyx.com"
      subject: "[ANASUKA] Newsletter"
      text: "Thanks for signing up!"
