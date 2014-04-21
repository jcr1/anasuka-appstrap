Meteor.startup ->
  Session.set 'analysis', false

Template.questionaire.questions = ->
  Questions.find()

Template.questionaire.created = ->
  console.log 'created'
  Session.set 'rest', true
  Session.set 'finalyet', false
  Session.set 'score', 0
  window.answers = []

  if Session.equals 'finalyet', false
    console.log 'wow'
    setTimeout ->
      window.deck = bespoke.from "#presentation", progress: true
    , 500

Template.questionaire.events 

  "click .next": ->
    # template data, if any, is available in 'this'
    if $(".bespoke-active input:checked").val()
      answers.push Session.get 'answer'
      Session.set 'finalanswers', answers
      deck.next()
    else 
      console.log 'need flash'

  "click .back": ->
    answers.pop()
    Session.set 'finalanswers', answers
    deck.prev()

  "click .almost-finish": (e, t) ->
    if $("#amount").val().length > 0
      Session.set 'amount', t.find('#amount').value
      deck.next()

      score = _.reduce answers, ((memo, num) ->
        memo + num.point
      ), 0

      Session.set 'score', score
      console.log score, 'SCORE'

      window.time = new Date()

      Datas.insert
        timestamp: time
        score: Session.get 'score'
        investment: Session.get 'amount'
        answers: Session.get 'finalanswers'

  "click .almost-back": ->
    answers.pop()
    Session.set 'finalanswers', answers
    console.log 'almost back'
    deck.prev()

  "click .finish": (e, t) ->
    if $("#email").val().length > 0
      Session.set 'email', t.find('#email').value
      Datas.update({_id:Datas.findOne({timestamp: time})['_id']}, {$set:{email:Session.get('email')}})

      $('.loading').fadeIn()
      deck.next()

      setTimeout ->
        $('.loading').fadeOut()
        deck.next()
        Session.set 'finalyet', true
      , 3000

  "click .finish-back": ->
    Session.set 'amount', null
    console.log 'finish back'
    deck.prev()

  'change input[type=radio]': (e, t) ->
    console.log @
    Session.set 'answer', @

Template.finalslide.final = ->
    Session.get 'finalanswers'

Template.finalslide.score = ->
  answers = Session.get 'finalanswers'
  score = _.reduce answers, ((memo, num) ->
    memo + num.point
  ), 0

  if score > 3 and score < 9
    1
  else if  score > 10 and score < 18
    2
  else if score > 19 and  score < 25
    3
  else if score > 26 and score < 34
    4
  else if score > 35 and score < 41
    5

Template.finalslide.breakdown = ->
  Session.get 'breakdown'

Template.finalslide.test = (percent) ->
  amount = Session.get 'amount'
  invest = amount * parseFloat(percent)
  invest.toFixed(2)

Template.finalslide.done = ->
  Session.equals 'done', true

Template.finalslide.finalyet = ->
  console.log (Session.equals 'finalyet', true), 'finalyet?'
  Session.equals 'finalyet', true

Template.finalslide.rendered = ->
  console.log 'finalslide2'
  w = 400
  h = 400
  r = 150
  inner = 50
  color = d3.scale.category20c()
  amount = Session.get 'amount'
  answers = Session.get 'finalanswers'
  comma = d3.format(',.2f')
  score =   Session.get 'score'
  console.log score, 'SCORE'

  if score >= 5 and score <= 20
    window.breakdown = [
      {"name": "US Equities", "symbol":"SPY", "value":0.11},
      {"name": "Non US Equities", "symbol":"EFA", "value":0.09}, 
      {"name": "US Treasury Bonds", "symbol":"TLT", "value":0.35}, 
      {"name": "US Corporate Bonds", "symbol":"LQD", "value":0.3}, 
      {"name": "Non US Treasury Bonds", "symbol":"BWX", "value":0.1}, 
      {"name": "Cash", "symbol":"CASH", "value":0.05}
    ]
    console.log 'got breakdown 1'
    Session.set 'portfolio', 1
  else if score >= 21 and score <= 30
    window.breakdown = [
      {"name": "US Equities","symbol":"SPY", "value":0.15},
      {"name": "Large Cap Value", "symbol":"IWD", "value":0.05},
      {"name": "Non US Equities", "symbol":"EFA", "value":0.15}, 
      {"name": "US Treasury Bonds", "symbol":"TLT", "value":0.21}, 
      {"name": "US Corporate Bonds", "symbol":"LQD", "value":0.21}, 
      {"name": "US High Yield Bonds", "symbol":"HYG", "value":0.04}, 
      {"name": "Non US Treasury Bonds", "symbol":"BWX", "value":0.14}, 
      {"name": "Cash", "symbol":"CASH", "value":0.05}
    ]
    Session.set 'breakdown', breakdown
    Session.set 'portfolio', 2
    console.log 'got breakdown 2'
  else if score >= 31 and score <= 51
    window.breakdown = [
      {"name": "US Equities", "symbol":"SPY", "value":0.23},
      {"name": "Large Cap Value", "symbol":"IWD", "value":0.07},
      {"name": "Non US Equities", "symbol":"EFA", "value":0.2}, 
      {"name": "Emerging Markets", "symbol":"VWO", "value":0.05}, 
      {"name": "US Treasury Bonds", "symbol":"TLT", "value":0.1}, 
      {"name": "US Corporate Bonds", "symbol":"LQD", "value":0.12}, 
      {"name": "US High Yield Bonds", "symbol":"HYG", "value":0.05}, 
      {"name": "Non US Treasury Bonds", "symbol":"BWX", "value":0.13}, 
      {"name": "Cash", "symbol":"CASH", "value":0.05}
    ]
    Session.set 'breakdown', breakdown
    Session.set 'portfolio', 3
    console.log 'got breakdown 3'
  else if score >= 52 and score <= 61
    window.breakdown = [
      {"name": "US Equities", "symbol":"SPY", "value":0.26},
      {"name": "Large Cap Value", "symbol":"IWD", "value":0.07},
      {"name": "Small Cap Value", "symbol":"IWM", "value":0.04},
      {"name": "Non US Equities", "symbol":"EFA", "value":0.26}, 
      {"name": "Emerging Markets", "symbol":"VWO", "value":0.07}, 
      {"name": "US Treasury Bonds", "symbol":"TLT", "value":0.06}, 
      {"name": "US Corporate Bonds", "symbol":"LQD", "value":0.06}, 
      {"name": "US High Yield Bonds", "symbol":"HYG", "value":0.04}, 
      {"name": "Non US Treasury Bonds", "symbol":"BWX", "value":0.09}, 
      {"name": "Cash", "symbol":"CASH", "value":0.05}
    ]
    Session.set 'breakdown', breakdown
    Session.set 'portfolio', 4
    console.log 'got breakdown 4'
  else if score >= 62 and score <= 77
    window.breakdown = [
      {"name": "US Equities", "symbol":"SPY", "value":0.35},
      {"name": "Large Cap Value", "symbol":"IWD", "value":0.11},
      {"name": "Small Cap Value", "symbol":"IWM", "value":0.05},
      {"name": "Non US Equities", "symbol":"EFA", "value":0.34}, 
      {"name": "Emerging Markets", "symbol":"VWO", "value":0.1}, 
      {"name": "Cash", "symbol":"CASH", "value":0.05}
    ]
    Session.set 'breakdown', breakdown
    Session.set 'portfolio', 5
    console.log 'got breakdown 5'

  data = _.map(window.breakdown, (i) ->
    'Asset Class' : i.name
    Symbol : i.symbol
    Percentage: "#{(i.value * 100).toFixed(0)}%"
    value : (i.value * amount).toFixed(2)
    Value : "$#{comma((i.value * amount).toFixed(2))}"
  )
  console.log data, 'data from breakdown'

  total = d3.sum(data, (d) ->
    console.log d, 'data'
    d3.sum d3.values(d)
  )
  
  vis = d3.select("#chart1")
    .append("svg:svg")
    .data([data])
      .attr("width", w)
      .attr("height", h)
    .append("svg:g")
      .attr("transform", "translate(" + 200 + "," + 200 + ")")
  
  textTop = vis.append("text")
    .attr("dy", ".35em")
    .style("text-anchor", "middle")
    .attr("class", "textTop")
    .text("TOTAL")
    .attr("y", -10)
  
  textBottom = vis.append("text")
    .attr("dy", ".35em")
    .style("text-anchor", "middle")
    .attr("class", "textBottom")
    .text("$#{comma(total.toFixed(2))}")
    .attr("y", 10)
  
  arc = d3.svg.arc()
    .innerRadius(inner)
    .outerRadius(r)
  
  arcOver = d3.svg.arc()
    .innerRadius(inner + 5)
    .outerRadius(r + 5)
  
  pie = d3.layout.pie().value((d) ->
    d.value
  )

  arcs = vis.selectAll("g.slice")
    .data(pie).enter()
    .append("svg:g")
      .attr("class", "slice")
      .on("mouseover", (d, i) ->
        console.log i
        d3.select(this).select("path")
          .transition()
          .duration(200)
          .attr "d", arcOver
          textTop.text(d3.select(this).datum().data.Symbol).attr("y", -10).attr('color')
          textBottom.text("$" + comma(d3.select(this).datum().data.value)).attr "y", 10
          return
        )
      .on("mouseout", (d) ->
        d3.select(this).select("path").transition().duration(100).attr "d", arc
        textTop.text("TOTAL").attr "y", -10
        textBottom.text "$" + comma(Session.get 'amount')
        return
      )

  arcs.append("svg:path")
    .attr("fill", (d, i) ->
      color i
    ).attr "d", arc

  tabulate = (data, columns) ->
    table = d3.select('#tablee').append('table')
      .attr('class', 'table')
    thead = table.append("thead")
    tbody = table.append("tbody")
    
    # append the header row
    thead.append("tr").selectAll("th").data(columns).enter().append("th").text (column) ->
      column
    
    # create a row for each object in the data
    rows = tbody.selectAll("tr").data(data).enter().append("tr").style('border-left', (d, i) -> "20px solid #{color i}")
    
    # create a cell in each row for each column
    cells = rows.selectAll("td").data((row) ->
      console.log row, 'row'
      c = columns.map (column) ->
        column: column
        value: row[column]
      console.log c, 'columns'
      c

    ).enter().append("td").text((d) ->
      d.value
    )
    table

  tabulate(data, ["Asset Class", "Symbol", "Percentage", "Value"])

  # table = d3.select('#tablee').append('table')
  #   .attr('class', 'table')

  # tbody = table.append('tbody')

  # rows = tbody.selectAll('tr')
  #   .data(data).enter()
  #   .append('tr')

  # cells = rows.selectAll('td')
  #   .data((row) -> row)
  #   .enter()
  #   .append("td")
  #   .attr('class', (d) -> console.log d, 'cells data')

  # cells = rows.selectAll('td')
  #   .data((row) -> console.log row)
  #   .enter()
  #   .append('td')
  #   .attr 'class', (d, i) -> console.log d, color i

  # legend = d3.select("#chart1").append("svg")
  #   .attr("class", "legend")
  #   .attr("width", 100)
  #   .attr("height", r * 2)
  # .selectAll("g")
  #   .data(data).enter()
  #   .append("g")
  #     .attr "transform", (d, i) ->
  #       "translate(0," + i * 25 + ")"

  # legend.append("rect")
  #   .attr("width", 16)
  #   .attr("height", 16)
  #   .style "fill", (d, i) ->
  #     color i

  # legend.append("text")
  #   .attr("x", 24)
  #   .attr("y", 7)
  #   .attr("dy", ".35em")
  #   .text (d) ->
  #     d.label

  # legend.on 'mouseover', ->
  #   console.log 'mouseover'

Template.finalslide.advisory = ->
  amount = Session.get 'amount'
  value = amount * 0.005/12
  Session.set 'advisory', value
  value.toFixed(2)

Template.finalslide.monthly = ->
  amount = Session.get 'amount'
  if Session.equals('portfolio', 1)
    value = amount * 0.00015667
    Session.set 'monthly', value
    value.toFixed(2)
  else if Session.equals('portfolio', 2)
    value = amount * 0.00019042
    Session.set 'monthly', value
    value.toFixed(2)
  else if Session.equals('portfolio', 3)
    value = amount * 0.00019675
    Session.set 'monthly', value
    value.toFixed(2)
  else if Session.equals('portfolio', 4)
    value = amount * 0.00019500
    Session.set 'monthly', value
    value.toFixed(2)
  else if Session.equals('portfolio', 5)
    value = amount * 0.00016942
    Session.set 'monthly', value
    value.toFixed(2)

Template.finalslide.total = ->
  advisory = Session.get 'advisory'
  monthly = Session.get 'monthly'
  total = advisory + monthly
  total.toFixed(2)

Template.finalslide.events
  'click #submit': (e, t) ->
    email_address = $('#email').val()
    
    Meteor.call('sendEmail', email_address)
    
    Emails.insert
      email: email_address
    
    Session.set('done', true)

Template.aboutyou.final = ->
  Session.get 'finalanswers'