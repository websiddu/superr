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

  _next = ->
    el.className = "animated fadeInUp"
    rword = _getWord()
    el.innerHTML = rword
    document.location.hash = rword;

    while prev == rand
      rand = Math.floor(Math.random() * 8)
    canv.className = "page c#{rand+1}"
    prev = rand

  _bindEvents = ->
    window.addEventListener("keydown", _checkDownKeyPressed, false)
    window.addEventListener("keyup", _checkKeyPressed, false)

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

  _getWord = ->
    return words[Math.floor(Math.random() * words.length)]

  init: ->
    _bindEvents()
    _next()
    return

S.init()


