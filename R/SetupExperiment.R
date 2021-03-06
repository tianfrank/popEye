
SetupExperiment <- function(env = parent.frame(n = 1)) {
  
  
  # setup tracker
  tracker <- list(model = env$tracker.model, 
                  software = env$tracker.software,
                  results = env$tracker.results)
  
  # setup experiment type
  type <- env$type
  
  # messages
  message <- list(start = NA, stop = NA)  
  message$start <- env$message.start
  message$stop <- env$message.stop
  
  if (env$type == "boundary" | env$type == "fast") {
    message$boundary <- env$message.boundary
    message$target <- env$message.target
  }

  if (env$type == "fast") {
    message$prime <- env$message.prime
  }
  
  # variable
  variable <- list(id = env$variable.id,
               cond = env$variable.cond)
  
  # item
  item <- list(pracnum = env$item.pracnum,
               practice = env$item.practice,
               trigger = env$item.trigger,
               question = env$item.question)
  
  # stimfile
  stimulus <- list(file = env$stimulus.file,
                   id = env$stimulus.id,
                   cond = env$stimulus.cond,
                   preview = env$stimulus.preview,
                   prime = env$stimulus.prime,
                   text = env$stimulus.text)

  # indicator
  indicator <- list(word = env$indicator.word,
                    ia = env$indicator.ia,
                    target = env$indicator.target,
                    line = env$indicator.line)                 
  
  # display
  display <- list(marginLeft = env$display.marginLeft,
                  marginTop = env$display.marginTop,
                  marginRight = env$display.marginRight,
                  marginBottom = env$display.marginBottom)
  # TODO: add physical width/height/dist in cm (for visual angle calculations)
  # TODO: add aspect ration(4:3, 16:10, 16:9 for plots)
  
  
  # font
  # -----
  
  # TODO: specify height indicators for all fonts
  # NOTE: maybe in separate function
  
  # font type
  font <- list(name = env$font.name, 
               size = env$font.size,
               spacing = env$font.spacing)
  
  if (env$font.name == "CourierNew") {
    font$family <- "mono"
  } else if (env$font.name == "Symbol") {
    font$family <- "HersheySymbol"
  } else {
    font$family <- "unknown"
  }
  
  
  # CourierNew
  # -----------
  
  # CourierNew, 14 pt
  if (font$name == "CourierNew" & font$size == 14) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                "ş","ı","ç","ğ","Ç","İ","Ş",
                " ", ",",".","?","!","–", "-","’","´","„","“",":","\"",";","”",
                "(", ")","'","‘", "—", "«", "»",
                "í", "ó", "ò", "É", "é", "è", "á", "à", "ñ", "ú", "ë", "ï", "ì", 
                "â", "ù", "È", "ø", "å", "\u00e6","\ufb00","\ufb01",
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
    pixel <- rep(11, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 16
    font$lead <- 3
    font$right <- F
  }
  
  # CourierNew, 16 pt
  if (font$name == "CourierNew" & font$size == 16) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                "ş","ı","ç","ğ","Ç","İ","Ş",
                " ", ",",".","?","!","–", "-","’","´","„","“",":","\"",";","”",
                "(", ")","'","‘", "—", "«", "»",
                "í", "ó", "ò", "É", "é", "è", "á", "à", "ñ", "ú", "ë", "ï", "ì", 
                "â", "ù", "È", "ø", "å", "\u00e6","\ufb00","\ufb01",
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
    pixel <- rep(13, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 18
    font$lead <- 4
    font$right <- F
  }
  
  # CourierNew, 18 pt
  if (font$name == "CourierNew" & font$size == 18) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                "ş","ı","ç","ğ","Ç","İ","Ş",
                " ", ",",".","?","!","–", "-","’","´","„","“",":","\"",";","”",
                "(", ")","'","‘", "—", "«", "»",
                "í", "ó", "ò", "É", "é", "è", "á", "à", "ñ", "ú", "ë", "ï", "ì", 
                "â", "ù", "È", "ø", "å", "\u00e6","\ufb00","\ufb01",
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
    pixel <- rep(14, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 20
    font$lead <- 5
    font$right <- F
  }
  
  # CourierNew, 20 pt
  if (font$name == "CourierNew" & font$size == 20) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                "ş","ı","ç","ğ","Ç","İ","Ş",
                " ", ",",".","?","!","–", "-","’","´","„","“",":","\"",";","”",
                "(", ")","'","‘", "—", "«", "»",
                "í", "ó", "ò", "É", "é", "è", "á", "à", "ñ", "ú", "ë", "ï", "ì", 
                "â", "ù", "È", "ø", "å", "\u00e6","\ufb00","\ufb01",
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
    pixel <- rep(16, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 22
    font$lead <- 6
    font$right <- F
  }
  
  # CourierHebrew 20 pt
  if (font$name == "CourierHebrew" & font$size == 20) {
    letter <- c(" ", "-", "–", "," , ":", ".", "'", "\"", "0", "1", "2", "8", "C", 
                "\u05d4", "\u05d3", "\u05d2", "\u05d1", "\u05d0", "\u05e5",
                "\u05e6", "\u05e3", "\u05e4", "\u05e2", "\u05e1", "\u05df",
                "\u05e0", "\u05dd", "\u05de", "\u05dc", "\u05da", "\u05db",
                "\u05d9", "\u05d8", "\u05d7", "\u05d6", "\u05d5", "\u05ea",
                "\u05e9", "\u05e8", "\u05e7")
    pixel <- rep(16, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 22
    font$lead <- 5
    font$right <- T
  }
  
  
  # Consolas
  # --------
  
  # Consolas, 18 pt
  if (font$name == "Consolas" & font$size == 18) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                "ş","ı","ç","ğ","Ç","İ","Ş",
                " ", ",",".","?","!","–", "-","’","´","„","“",":","\"",";","”",
                "(", ")","'","‘", "—", "«", "»", "%",
                "í", "ó", "ò", "É", "é", "è", "á", "à", "ñ", "ú", "ë", "ï", "ì", 
                "â", "ù", "È", "ø", "å", "\u00a0", "æ",  
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
    pixel <- rep(13, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 22
    font$lead <- 7
    font$right <- F
  }
  
  # Consolas, 20 pt
  if (font$name == "Consolas" & font$size == 20) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                "ş","ı","ç","ğ","Ç","İ","Ş",
                " ", ",",".","?","!","–", "-","’","´","„","“",":","\"",";","”",
                "(", ")","'","‘", "—", "«", "»", "%",
                "í", "ó", "ò", "É", "é", "è", "á", "à", "ñ", "ú", "ë", "ï", "ì", 
                "â", "ù", "È", "ø", "å", "\u00a0", "æ",  
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
    pixel <- rep(15, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 24
    font$lead <- 9
    font$right <- F
  }
  
  # Consolas, 22 pt
  if (font$name == "Consolas" & font$size == 22) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                "ş","ı","ç","ğ","Ç","İ","Ş",
                " ", ",",".","?","!","–", "-","’","´","„","“",":","\"",";","”",
                "(", ")","'","‘", "—", "«", "»", "%",
                "í", "ó", "ò", "É", "é", "è", "á", "à", "ñ", "ú", "ë", "ï", "ì", 
                "â", "ù", "È", "ø", "å", "\u00a0", "æ",  
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
    pixel <- rep(16, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 25
    font$lead <- 9
    font$right <- F
  } 
  
  # ConsolasRussian 20 pt
  if (font$name == "ConsolasRussian" & font$size == 20) {
    letter <- c(" ", "-", "–", "—", ",", ":", "!", ".",  "«", "»", "(", ")",
                "1", "4", "7", "9", "\u0430", "\u0410", "\u0431", "\u0411", 
                "\u0432", "\u0412", "\u0433", "\u0413", "\u0434", "\u0414", 
                "\u0435", "\u0415", "\u0451", "\u0436", "\u0416", "\u0437", 
                "\u0417", "\u0438", "\u0418", "\u0439", "\u043a", "\u041a",
                "\u043b", "\u043c", "\u041c", "\u043d", "\u041d", "\u043e", 
                "\u041e", "\u043f", "\u041f", "\u0440", "\u0420", "\u0441", 
                "\u0421", "\u0442", "\u0422", "\u0443", "\u0423", "\u0444", 
                "\u0424", "\u0445", "\u0425", "\u0446", "\u0447", "\u0427", 
                "\u0448", "\u0428", "\u0449", "\u044a", "\u044b", "\u044c", 
                "\u044d", "\u042d", "\u044e", "\u042e", "\u044f", "\u042f")
    pixel <- rep(15, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 24
    font$lead <- 9
    font$right <- F
  }
  
  # ConsolasGreek 20 pt
  if (font$name == "ConsolasGreek" & font$size == 20) {
    letter <- c(" ", "-", "–", ",", ";", ":", ".", "’", "«", "»", "(", ")", "∙",
                "0", "1", "2", "4", "6", "7", "8", "9", "a", "A", "h", "i", "l",
                "o", "p", "r", "S", "t", "\u03b1", "\u0391", "\u03ac", "\u0386",
                "\u0386", "\u0392", "\u03b3", "\u0393", "\u03b4", "\u0394", 
                "\u03b5", "\u0395", "\u03ad", "\u0388", "\u03b6", "\u03b7", 
                "\u0397", "\u03ae", "\u03b8", "\u03b9", "\u0399", "\u03af", 
                "\u03af", "\u03ba", "\u039a", "\u03bb", "\u039b", "\u03bc", 
                "\u039c", "\u03bd", "\u039d", "\u03be", "\u03bf", "\u039f",
                "\u03cc", "\u038c", "\u03c0", "\u03a0", "\u03c1", "\u03a1", 
                "\u03c3", "\u03a3", "\u03c2", "\u03c4", "\u03a4", "\u03c5", 
                "\u03cd", "\u03c6", "\u03a6", "\u03c7", "\u03a7", "\u03c8", 
                "\u03c9", "\u03a9", "\u03ce", "\u03ca", "\u03b2")
    pixel <- rep(15, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 24
    font$lead <- 9
    font$right <- F
  }
  
  # TahomaKorean 24 pt
  if (font$name == "TahomaKorean" & font$size == 24) {
    letter <- c(" ","\u00a0","\u2014","\u002c","\u003a","\u002e","\u2018",
                "\u2019","\u201c","\u201d","\u0028","\u0029","\u007e","\u0030",
                "\u0031","\u0032","\u0033","\u0034","\u0035","\u0036","\u0037",
                "\u0038","\u0039","\u0043","\u0049","\u004f","\u0054","\u0056",
                "\uac00","\uac01","\uac04","\uac08","\uac10","\uac15","\uac16",
                "\uac19","\uac1c","\uac1d","\uac70","\uac74","\uac78","\uac80",
                "\uac83","\uac8c","\uaca8","\uaca9","\uacac","\uacb0","\uacbd",
                "\uacc4","\uace0","\uace7","\uace8","\uacf3","\uacf5","\uacfc",
                "\uad00","\uad11","\uad34","\uad50","\uad6c","\uad6d","\uad70",
                "\uad74","\uad8c","\uadc0","\uaddc","\uade0","\uadf8","\uadf9",
                "\uadfc","\uae00","\uae08","\uae09","\uae0b","\uae30","\uae34",
                "\uae43","\uae4c","\uae50","\uae54","\uaf43","\uafc0","\ub048",
                "\ub05d","\ub07c","\ub098","\ub09c","\ub0a0","\ub0a8","\ub0ae",
                "\ub0b4","\ub0b8","\ub0bc","\ub108","\ub110","\ub113","\ub118",
                "\ub123","\ub124","\ub140","\ub144","\ub150","\ub178","\ub17c",
                "\ub18d","\ub192","\ub193","\ub204","\ub208","\ub274","\ub291",
                "\ub294","\ub298","\ub2a5","\ub2a6","\ub2ac","\ub2c8","\ub2cc",
                "\ub2e4","\ub2e8","\ub2eb","\ub2ec","\ub2f9","\ub2ff","\ub300",
                "\ub354","\ub358","\ub369","\ub370","\ub374","\ub3c4","\ub3c5",
                "\ub3d5","\ub3d9","\ub418","\ub41c","\ub420","\ub450","\ub454",
                "\ub458","\ub465","\ub4a4","\ub4dc","\ub4e0","\ub4e4","\ub4ed",
                "\ub4ef","\ub4f1","\ub514","\ub529","\ub530","\ub545","\ub54c",
                "\ub5a4","\ub5a8","\ub610","\ub611","\ub6ab","\ub728","\ub77c",
                "\ub77d","\ub780","\ub78c","\ub78d","\ub791","\ub798","\ub799",
                "\ub79c","\ub7b5","\ub7c9","\ub7ec","\ub7ed","\ub7f0","\ub7fc",
                "\ub7fd","\ub807","\ub808","\ub80c","\ub824","\ub825","\ub828",
                "\ub834","\ub838","\ub85c","\ub85d","\ub86d","\ub8b0","\ub8cc",
                "\ub8e8","\ub904","\ub958","\ub959","\ub974","\ub978","\ub97c",
                "\ub984","\ub9ac","\ub9b0","\ub9b4","\ub9bc","\ub9bd","\ub9c1",
                "\ub9c8","\ub9c9","\ub9cc","\ub9ce","\ub9d0","\ub9db","\ub9de",
                "\ub9e4","\ub9e8","\ub9f9","\uba38","\uba39","\uba48","\uba4d",
                "\uba54","\uba70","\uba74","\uba78","\uba85","\uba87","\ubaa8",
                "\ubaa9","\ubaac","\ubab0","\ubab8","\ubabb","\ubb34","\ubb38",
                "\ubb3c","\ubbc0","\ubbf8","\ubbfc","\ubc00","\ubc0f","\ubc14",
                "\ubc16","\ubc18","\ubc1b","\ubc1c","\ubc1d","\ubc29","\ubc2d",
                "\ubc30","\ubc40","\ubc88","\ubc8c","\ubc94","\ubc95","\ubca4",
                "\ubcc0","\ubcc4","\ubcd1","\ubcf4","\ubcf8","\ubcfc","\ubd09",
                "\ubd80","\ubd84","\ubd88","\ube14","\ube44","\ube5b","\ube68",
                "\ube7c","\ubfd0","\uc05c","\uc0ac","\uc0b0","\uc0b4","\uc0bc",
                "\uc0c1","\uc0c8","\uc0c9","\uc0dd","\uc0e4","\uc11c","\uc11d",
                "\uc11e","\uc120","\uc124","\uc12c","\uc131","\uc138","\uc13c",
                "\uc158","\uc18c","\uc18d","\uc190","\uc1a1","\uc1c4","\uc218",
                "\uc21c","\uc220","\uc22b","\uc22d","\uc234","\uc27d","\uc2a4",
                "\uc2b5","\uc2b7","\uc2b9","\uc2dc","\uc2dd","\uc2e0","\uc2e4",
                "\uc2ec","\uc2ed","\uc368","\uc37c","\uc4f0","\uc529","\uc544",
                "\uc545","\uc548","\uc54a","\uc54c","\uc554","\uc557","\uc558",
                "\uc561","\uc57c","\uc57d","\uc591","\uc5b4","\uc5b8","\uc5bc",
                "\uc5c4","\uc5c5","\uc5c6","\uc5c7","\uc5c8","\uc5d0","\uc5d4",
                "\uc5ec","\uc5ed","\uc5f0","\uc5f4","\uc5fc","\uc600","\uc601",
                "\uc608","\uc624","\uc628","\uc62c","\uc62e","\uc637","\uc640",
                "\uc644","\uc654","\uc678","\uc694","\uc6a9","\uc6b0","\uc6b1",
                "\uc6b4","\uc6c0","\uc6d0","\uc6d4","\uc6e0","\uc6e8","\uc704",
                "\uc720","\uc721","\uc724","\uc728","\uc73c","\uc740","\uc744",
                "\uc74c","\uc751","\uc758","\uc774","\uc778","\uc77c","\uc783",
                "\uc784","\uc785","\uc788","\uc790","\uc791","\uc794","\uc798",
                "\uc7a0","\uc7a5","\uc7ac","\uc7ad","\uc7c1","\uc800","\uc801",
                "\uc804","\uc810","\uc811","\uc815","\uc81c","\uc824","\uc838",
                "\uc84c","\uc870","\uc871","\uc874","\uc880","\uc885","\uc88b",
                "\uc8c4","\uc8fc","\uc8fd","\uc900","\uc904","\uc911","\uc988",
                "\uc989","\uc998","\uc999","\uc99d","\uc9c0","\uc9c1","\uc9c4",
                "\uc9c8","\uc9d1","\uc9d5","\uc9dc","\uc9dd","\ucabd","\ucc28",
                "\ucc29","\ucc2c","\ucc38","\ucc3e","\ucc44","\ucc45","\ucc98",
                "\ucc9c","\ucca0","\ucca8","\uccab","\uccb4","\uccd0","\ucd08",
                "\ucd09","\ucd1d","\ucd5c","\ucd94","\ucd95","\ucd98","\ucd9c",
                "\ucde8","\uce20","\uce21","\uce35","\uce58","\uce5c","\uce68",
                "\uce74","\uce78","\uce98","\ucea0","\ucee4","\uceec","\ucef7",
                "\ucf54","\ud06c","\ud070","\ud074","\ud07c","\ud0a4","\ud0c0",
                "\ud0c8","\ud0d5","\ud0dc","\ud0dd","\ud130","\ud14c","\ud1a0",
                "\ud1a1","\ud1b5","\ud1f4","\ud2b8","\ud2b9","\ud2c0","\ud2f0",
                "\ud2f1","\ud30c","\ud310","\ud314","\ud328","\ud37c","\ud398",
                "\ud3b4","\ud3b8","\ud3c9","\ud3d0","\ud3ec","\ud3f4","\ud45c",
                "\ud488","\ud504","\ud50c","\ud53c","\ud53d","\ud544","\ud551",
                "\ud558","\ud559","\ud55c","\ud560","\ud568","\ud56d","\ud574",
                "\ud575","\ud588","\ud589","\ud5a5","\ud600","\ud604","\ud608",
                "\ud611","\ud614","\ud615","\ud638","\ud639","\ud63c","\ud640",
                "\ud654","\ud655","\ud658","\ud65c","\ud68c","\ud6c4","\ud76c",
                "\ud788")
    pixel <- c(16, 16, 16, 16, 16, 16, 16,
               16, 16, 16, 16, 16, 16, 16,
               16, 16, 16, 16, 16, 16, 16,
               16, 16, 16, 16, 16, 16, 16,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32,32,32,32,32,32,32,
               32)
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 26
    font$lead <- 10
    font$right <- F
  }
  
  
  # TimesNew Roman
  # ---------------
  
  # TimesNewRoman, 16 pt
  if (font$name == "TimesNewRoman" & font$size == 16) {
    letter <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m",
                "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
                "ä", "ö", "ü", "ß", "é", "è", "ï", "í",
                "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
                "N",  "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
                "Ä", "Ö", "Ü",
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0",
                " ", ".", ",", ";", ":", "-", "_", "#", "*", "+", "~", "\"", "!", "?",
                "%", "&", "/", "(", ")", "$", "[", "]", "=", "\\", "§", "'", "<",
                ">", "|", "°", "€", "^", "}", "{")  
    
    pixel <- c(9, 10,  9, 10,  9,  7, 10, 10,  6,  6, 10,  6, 16,
               10, 11, 10, 10,  7,  8,  6, 11, 10, 15, 10, 9, 9,  
               9, 11, 11, 10, 9, 9, 6, 6,
               14, 14, 14, 15, 13, 11, 15, 15,  6,  8, 15, 12, 18,
               15, 15, 12, 15, 14, 10, 12, 15, 15, 19, 14, 15, 12,
               15, 15, 15,
               11, 11, 11, 12, 11, 11, 12, 11, 11, 11,
               5, 5,  5,  5,  6, 7, 11, 11, 10, 12, 11, 8, 6, 10, 
               18, 16,  6, 7,  7, 11, 7, 7, 12, 6, 11, 4, 12, 12, 3,
               8, 11, 10, 10, 10)
    
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 20
    font$lead <- 5
    font$right <- F
  }
  
  
  # Symbol
  # ------
  
  # Symbol, 13 pt 
  # TODO: height/lead missing
  if (font$name == "Symbol" & font$size == 13) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                " ", ",",".","?","!")
    pixel <- c(19,17,17,19,17,17,19,16,19,8,11,21,20,22,19,19,13,
               19,18,15,16,18,19,NA,13,20,NA,21,17,
               14,14,13,14,12,11,15,13,14,8,11,14,14,13,13,14,13,15,12,13,16,12,11,
               13,13,17,17,13,17,10,
               12,6,5,NA,NA)
    # NOTE: "Ö" correct?
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- NA
    font$lead <- NA
    font$right <- F
  }

  # Symbol, 14 pt
  # TODO: height/lead missing
  if (font$name == "Symbol" & font$size == 14) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                " ", ",",".","?","!")
    pixel <- c(21,17,16,21,19,18,19,18,20,9,12,21,21,22,18,20,NA,
               20,NA,15,16,19,21,NA,12,22,NA,NA,18,
               15,15,13,14,12,11,15,13,14,7,11,14,16,15,13,13,13,
               16,NA,13,16,14,11,13,13,17,17,13,NA,11,
               14,3,3,NA,NA)
    # NOTE: "I" correct?
    font$letpix <- data.frame(letter = letter, pixel = pixel) 
    font$height <- NA
    font$lead <- NA
    font$right <- F
  }
  
  
  # Tahoma
  # -------
  
  # Tahoma, 13 pt
  if (font$name == "Tahoma" & font$size == 13) {
    letter <- c("A","Ä","B","C","D","E","F","G","H","I","J","K","L","M","N","O","Ö",
                "P","Q","R","S","T","U","Ü","V","W","X","Y","Z",
                "a","ä","b","c","d","e","f","g","h","i","j","k","l","m","n","o","ö",
                "p","q","r","s","ß","t","u","ü","v","w","x","y","z",
                " ", ",",".","?","!","–", "-","’","´","„","“",":","\"",";","”",
                "(", ")","'",
                "1", "2", "3", "4", "5", "6", "7", "8", "9", "0")
    pixel <- rep(11, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 14
    font$lead <- 2
    font$right <- F
  }
  
  # TahomaArabic 13 pt
  if (font$name == "TahomaArabic" & font$size == 13) {
    letter <- c(
      # diacritics
      "\u064b",
      "\u064c",
      "\u064d",
      "\u064e",
      "\u064f",
      "\u0650",
      "\u0651",
      "\u0652",
      
      # punctuation
      " ",
      ",",
      "\u060c",
      "\u061b",
      ":",
      ".",
      "\"",
      "“",
      "«",
      "»",
      "(",
      ")",
      "*",
      "6",
      
      # regular characters
      "\u0626",
      "\u0625",
      "\u0624",
      "\u0623",
      "\u0622",
      "\u0621",
      "\u062D",
      "\u062C",
      "\u062B",
      "\u062A",
      "\u0629",
      "\u0628",
      "\u0627",
      "\u0634",
      "\u0633",
      "\u0632",
      "\u0631",
      "\u0630",
      "\u062F",
      "\u062E",
      "\u0641",
      "\u063A",
      "\u0639",
      "\u0638",
      "\u0637",
      "\u0636",
      "\u0635",
      "\u0648",
      "\u0647",
      "\u0646",
      "\u0645",
      "\u0644",
      "\u0643",
      "\u0642",
      "\u064A",
      "\u0649"
    )
    pixel <- rep(10, length(letter))
    font$letpix <- data.frame(letter = letter, pixel = pixel)
    font$height <- 14
    font$lead <- 2
    font$right <- T
  }
  
  # print classes
  font$print$up <- c("A","E","I","O","U","Q","W","R","T","Z","P","S","D","F",
                     "G","H","J","K","L","Y","X","C","V","B","N","M","Ä","Ö",
                     "Ü","d","f","h","k","l","t","b","ß","i","ä","ö","ü","?",
                     "!")
  font$print$mi <- c("v","w","r","z","s","x","c","n","m","a","e","o","u")
  font$print$de <- c("q","p","g","j","y")
  font$print$pu <- c(".",",","–")

  # analysis
  analysis <- list(eyelink = env$analysis.eyelink, vfac = env$analysis.vfac,
                   mindur = env$analysis.mindur, postdur = env$analysis.postdur,
                   drift = env$analysis.drift, sparse = env$analysis.sparse,
                   driftX = env$analysis.driftX, driftY = env$analysis.driftY,
                   translate = env$analysis.translate,
                   lineMethod = env$analysis.lineMethod,
                   outlierX = env$analysis.outlierX,
                   outlierY = env$analysis.outlierY,
                   lineX = env$analysis.lineX,
                   lineY= env$analysis.lineY)

  # cleaning
  clean <- list(stage1Dur = env$clean.stage1Dur, 
                stage1Dist = env$clean.stage1Dist,
                stage2Dur = env$clean.stage2Dur, 
                stage2Dist = env$clean.stage2Dist,
                stage3 = env$clean.stage3,
                stage3Dur = env$clean.stage3Dur,
                stage4 = env$clean.stage4,
                stage4Min = env$clean.stage4Min,
                stage4Max = env$clean.stage4Max,
                delete = env$clean.delete,
                outlier = env$clean.outlier
                )

  # exclude
  exclude <- list(nfix = env$exclude.nfix,
                  sac = env$exclude.sac)

  # write out
  setup <- list(tracker = tracker, type = type, message = message, item = item,
                variable = variable, stimulus = stimulus, indicator = indicator, 
                display = display, font = font, clean = clean, 
                analysis = analysis, exclude = exclude)
  
  return(setup)
  
}
