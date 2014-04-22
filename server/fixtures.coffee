if Questions.find().count() is 0

  Questions.insert
    qid: 1
    question: "Please tell us your age"
    answers: [
      answer: "Less than 25"
      point: 10
    ,
      answer: "25-39"
      point: 6
    ,
      answer: "39-51"
      point: 4
    ,
      answer: "51-60"
      point: 2
    ,
      answer: "Greater than 60"
      point: 0
    ]

  Questions.insert
    qid: 2
    question: "How would you describe your investment experience?"
    answers: [
      answer: "Novice"
      point: 2
    ,
      answer: "Average"
      point: 4
    ,
      answer: "Extensive"
      point: 6
    ]

  Questions.insert
    qid: 3
    question: "What is your investment goal?"
    answers: [
      answer: "Retirement"
      point: 6
    ,
      answer: "Investments"
      point: 6
    ,
      answer: "College"
      point: 4
    ,
      answer: "Buying a Vacation Home"
      point: 2
    ,
      answer: "Buying a Home"
      point: 2
    ,
      answer: "Generate Extra Income"
      point: 2
    ,
      answer: "Rainy Day"
      point: 0
    ]


  Questions.insert
    qid: 4
    question: "When will you need to withdraw funds from this portfolio?"
    answers: [
      answer: "less than 1 year"
      point: 0
    ,
      answer: "1 - 5 years"
      point: 2
    ,
      answer: "6 - 10 years"
      point: 4
    ,
      answer: "10 - 20 years"
      point: 6
    ,
      answer: "more than 20 years"
      point: 10
    ]

  Questions.insert
    qid: 5
    question: "The relationship between risk and return is positive. Higher returns require higher risk and vice-versa. For your portfolio you prefer?"
    answers: [
      answer: "Lower Risk"
      point: 2
    ,
      answer: "Moderate Risk"
      point: 5
    ,
      answer: "Higher Risk"
      point: 10
    ]

  Questions.insert
    qid: 6
    question: "In 2008 the stock market declined almost 40% in a 3 month peroiod. What would you do with your portfolio if this was to happen again?"
    answers: [
      answer: "Sell"
      point: 0
    ,
      answer: "Buy"
      point: 6
    ,
      answer: "Do Nothing"
      point: 4
    ]

  Questions.insert
    qid: 7
    question: "Knowing that investment portfolios are volatile, how long are you willing to wait regain any losses?"
    answers: [
      answer: "Less than 3 months"
      point: 0
    ,
      answer: "3 to 6 months"
      point: 2
    ,
      answer: "6 months to 1 year"
      point: 4
    ,
      answer: "1 to 2 years"
      point: 8
    ]

  Questions.insert
    qid: 8
    question: "How would you describe your current and future sources of income?"
    answers: [
      answer: "Unstable"
      point: 0
    ,
      answer: "Somewhat Stable"
      point: 2
    ,
      answer: "Stable"
      point: 4
    ,
      answer: "Very Stable"
      point: 8
    ]

  Questions.insert
    qid: 9
    question: "Please tell us about your after tax income"
    answers: [
      answer: "Less than 15,000"
      point: 0
    ,
      answer: "15,000 - 24,999"
      point: 1
    ,
      answer: "25,000 - 49,999"
      point: 2
    ,
      answer: "50,000 - 99,999"
      point: 3
    ,
      answer: "100,000 - 149,999"
      point: 4
    ,
      answer: "More than 150,000"
      point: 5
    ]

  Questions.insert
    qid: 6
    question: "And your cash and liquid assets"
    answers: [
      answer: "Less than 25,000"
      point: 1
    ,
      answer: "25,000 - 49,999"
      point: 2
    ,
      answer: "50,000 - 99,999"
      point: 3
    ,
      answer: "100,000 - 249,999"
      point: 5
    ,
      answer: "Greater than 250,000"
      point: 8
    ]
    