S = window.S or {}

S = do ->
  words = [
    "ace",
    "amazing",
    "astonishing",
    "astounding",
    "awe-inspiring",
    "awesome",
    "badass",
    "beautiful",
    "bedazzling",
    "best",
    "breathtaking",
    "brilliant",
    "cat's meow",
    "cat's pajamas",
    "classy",
    "cool",
    "dandy",
    "dazzling",
    "delightful",
    "divine",
    "doozie",
    "epic",
    "excellent",
    "exceptional",
    "exquisite",
    "extraordinary",
    "fabulous",
    "fantastic",
    "fantabulous",
    "fine",
    "finest",
    "first-class",
    "first-rate",
    "flawless",
    "funkadelic",
    "geometric",
    "glorious",
    "gnarly",
    "good",
    "grand",
    "great",
    "groovy",
    "groundbreaking",
    "hunky-dory",
    "impeccable",
    "impressive",
    "incredible",
    "kickass",
    "kryptonian",
    "laudable",
    "legendary",
    "lovely",
    "luminous",
    "magnificent",
    "majestic",
    "marvelous",
    "mathematical",
    "mind-blowing",
    "neat",
    "outstanding",
    "peachy",
    "perfect",
    "phenomenal",
    "pioneering",
    "polished",
    "posh",
    "praiseworthy",
    "premium",
    "priceless",
    "prime",
    "primo",
    "rad",
    "remarkable",
    "riveting",
    "sensational",
    "shining",
    "slick",
    "smashing",
    "solid",
    "spectacular",
    "splendid",
    "stellar",
    "striking",
    "stunning",
    "stupendous",
    "stylish",
    "sublime",
    "super",
    "super-duper",
    "super-excellent",
    "superb",
    "superior",
    "supreme",
    "swell",
    "terrific",
    "tiptop",
    "top-notch",
    "transcendent",
    "tremendous",
    "ultimate",
    "unreal",
    "well-made",
    "wicked",
    "wonderful",
    "wondrous",
    "world-class"
  ]

  prev = 1
  rand = 1
  canv = document.getElementById('awe-can')
  el = document.getElementById('awe-sel')
  input = document.getElementById('copyurl')
  shareurl = document.getElementById('shareurl')

  _next = ->
    el.className = "animated fadeInUp"
    rword = _getWord()
    el.innerHTML = rword

    while prev == rand
      rand = Math.floor(Math.random() * 8)
    canv.className = "page c#{rand+1}"
    prev = rand
    _updateUrls(rword)

  _bindEvents = ->
    window.addEventListener("keydown", _checkDownKeyPressed, false)
    window.addEventListener("keyup", _checkKeyPressed, false)
    input.addEventListener('click', _selectAllText, false)
    shareurl.addEventListener('click', _showLink, false)

  _showLink = ->
    input.className = "textfield active"
    input.select()

  _selectAllText = (e) ->
    this.select()

  _checkDownKeyPressed = (e) ->
    k = e.keyCode
    if k in [37, 38, 39, 40]
      el.className = ""
      if (canv.classList)
        canv.classList.add("o0");
      else
        canv.className += " " + "animate";

  _checkKeyPressed = (e) ->
    k = e.keyCode
    if k in [37, 38, 39, 40]
      _next()

  _updateUrls = (rword) ->
    twitter = document.getElementById('twitter')

    twitterUrl = "https://twitter.com/intent/tweet?original_referer=#{encodeURIComponent(document.URL)}&text=#{twitter.dataset.text}&tw_p=tweetbutton&url=#{encodeURIComponent(document.URL)}&via=#{twitter.dataset.via}"
    twitter.href = twitterUrl
    document.location.hash = rword;
    document.title = rword;
    input.value = document.URL

  _getWord = ->
    return words[Math.floor(Math.random() * words.length)]

  init: ->
    _bindEvents()
    _next()
    return

S.init()


