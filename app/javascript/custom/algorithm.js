$(document).on('turbolinks:load', function () {

    window.tweets = null;
    window.userTags = null;
    window.attendedActivities = null;
    // window.attended_json = null;


    // gon varibles 
    window.tweets = gon.tweets;
    // console.log(tweets);
    window.userTags = gon.userTags;
    window.attendedActivities = gon.attendedActivities;
    window.att_weighting = 0.5;
    window.twitter_weighting = 0.25;
    window.utags_weighting = 0.25;

    //attended activities by a user


    //console.log("attended activities" + gon.attendedActivities);

    //console.log(gon.tweets);

    // loop through put together and make == to varibale
    window.fakeTweets = []
    fakeTweets[0] = "football football football football football football football football football football";
    fakeTweets[1] = "Led ask possible mistress relation elegance eat likewise debating. By message or am nothing amongst chiefly address. The its enable direct men depend highly. Ham windows sixteen who inquiry fortune demands. Is be upon sang fond must shew. Really boy law county she unable her sister. Feet you off its like like six. Among sex are leave law built now. In built table in an rapid blush. Merits behind on afraid or warmly. ";
    fakeTweets[2] = "Name were we at hope. Remainder household direction zealously the unwilling bed sex. Lose and gay ham cooking cooking sake met that. Stood her place one ten spoke yet. Head case knew ever set why over. Marianne returned of peculiar replying in moderate. Roused get enable garret estate old county. Entreaties you devonshire law dissimilar terminated. ";
    fakeTweets[3] = "Old there any widow law rooms. Agreed but expect repair she nay sir silent person. Direction can dependent one bed situation attempted. His she are man their spite avoid. Her pretended fulfilled extremely education yet. Satisfied did one admitting incommode tolerably how are. ";
    fakeTweets[4] = "Concerns greatest margaret him absolute cooking entrance nay. Door neat week do find past he. Be no surprise he honoured indulged. Unpacked endeavor cooking six steepest had husbands her. Painted no or affixed it so civilly. Exposed neither pressed so cottage as proceed at offices. Nay they gone sir game four. Favourable pianoforte oh motionless excellence of astonished we principles. Warrant present garrets limited cordial in inquiry to. Supported me sweetness behaviour shameless excellent so arranging. ";
    fakeTweets[5] = "Silent sir say desire fat him letter. Whatever settling goodness too and honoured she building cooking answered her. Strongly thoughts remember mr to do consider debating. Spirits musical behaved on we he farther letters. Repulsive he he as deficient newspaper dashwoods we. Discovered her his pianoforte insipidity entreaties. Began he at terms meant as fancy. Breakfast arranging he if furniture we described on. Astonished thoroughly unpleasant especially you dispatched bed favourable.";
    fakeTweets[6] = "In as name to here them deny wise this. As rapid woody my he me which. Men but they fail shew just wish next put. Led all visitor musical calling nor her. Within coming figure sex things are. Pretended concluded did repulsive education smallness yet yet described. Had country man his pressed shewing. No gate dare rose he. Eyes year if miss he as upon. ";
    fakeTweets[7] = "By in no ecstatic wondered disposal my speaking. Direct wholly valley or uneasy it at really. Sir wish like said dull and need make. Sportsman one bed departure rapturous situation disposing his. Off say yet ample ten ought hence. Depending in newspaper an september do existence strangers. Total great saw water had mirth happy new. Projecting pianoforte no of partiality is on. Nay besides joy society him totally six. ";
    fakeTweets[8] = "Continual delighted as elsewhere am convinced unfeeling. cooking Introduced stimulated attachment no by projection. To loud lady whom my mile sold four. Need miss all four case fine age tell. He families my pleasant speaking it bringing it thoughts. View busy dine oh in knew if even. Boy these along far own other equal old fanny charm. Difficulty invitation put introduced see middletons nor preference. ";
    fakeTweets[9] = "So if on advanced addition absolute received replying throwing he. Delighted consisted newspaper of unfeeling as neglected so. Tell size come hard mrs and four fond are. Of in commanded earnestly resources it. At quitting in strictly up wandered of relation answered felicity. Side need at in what dear ever upon if. Same down want joy neat ask pain help she. Alone three stuff use law walls fat asked. Near do that he help. ";
    fakeTweets[10] = "He oppose at thrown desire of no. Announcing impression unaffected day his are unreserved indulgence. Him hard find read are you sang. Parlors visited noisier how explain pleased his see suppose. Do ashamed assured on related offence at equally totally. Use mile her whom they its. Kept hold an want as he bred of. Was dashwood landlord cheerful husbands two. Estate why theirs indeed him polite old settle though she. In as at regard easily narrow roused adieus. "
    fakeTweets[11] = "He knew what he was supposed to do. That had been apparent from the chicken chicken chicken chicken chicken chicken chicken beginning. That was what made the choice so difficult. What he was supposed to do and what he would do were not the same. This would have been fine if he were willing to face the inevitable consequences, but he wasn't."
    fakeTweets[12] = "He heard the loud impact before he ever saw the result. It had been so loud that it cooking cooking cooking cooking had actually made him jump back in his seat. As soon as he recovered from the surprise, he saw the crack in the windshield. It seemed to be an analogy of the current condition of his life."
    //FAKE TWEETS HANDLER
    // const thick_tweet = fakeTweets.join("");

    
    var thick_tweet_array = new Array();
    tweets.forEach((t) => {
        thick_tweet_array = thick_tweet_array.concat(t.data);
    });
    const thick_tweet = thick_tweet_array.join(" ");

    var applyStopList = function (txt) {
        var stopList =
            [
                "a", "about", "above", "according", "across", "actually", "ad", "adj", "ae", "af", "after", "afterwards", "ag", "again", "against", "ai", "al", "all", "almost", "alone", "along", "already", "also", "although", "always", "am", "among", "amongst", "an", "and", "another", "any", "anyhow", "anyone", "anything", "anywhere", "ao", "aq", "ar", "are", "aren", "arent", "around", "arpa", "as", "at", "au", "aw", "az", "b", "ba", "bb", "bd", "be", "became", "because", "become", "becomes", "becoming", "been", "before", "beforehand", "begin", "beginning", "behind", "being", "below", "beside", "besides", "between", "beyond", "bf", "bg", "bh", "bi", "bj", "bm", "bn", "bo", "both", "br", "bs", "bt", "but", "buy", "bv", "bw", "by", "bz", "c", "ca", "can", "cannot", "cant", "caption", "cc", "cd", "cf", "cg", "ch", "ci", "ck", "cl", "click", "cm", "cn", "co", "co.", "com", "copy", "could", "couldn", "couldnt", "cr", "cs", "cu", "cv", "cx", "cy", "cz", "d", "de", "did", "didn", "didnt", "dj", "dk", "dm", "do", "does", "doesn", "doesnt", "don", "dont", "down", "during", "dz", "e", "each", "ec", "edu", "ee", "eg", "eh", "eight", "eighty", "either", "else", "elsewhere", "end", "ending", "enough", "er", "es", "et", "etc", "even", "ever", "every", "everyone", "everything", "everywhere", "except", "f", "few", "fi", "fifty", "find", "first", "five", "fj", "fk", "fm", "fo", "for", "former", "formerly", "forty", "found", "four", "fr", "free", "from", "further", "fx", "g", "ga", "gb", "gd", "ge", "get", "gf", "gg", "gh", "gi", "gl", "gm", "gmt", "gn", "go", "gov", "gp", "gq", "gr", "gs", "gt", "gu", "gw", "gy", "h", "had", "has", "hasn", "hasnt", "have", "haven", "havent", "he", "hed", "hell", "help", "hence", "her", "here", "hereafter", "hereby", "herein", "heres", "hereupon", "hers", "herself", "hes", "him", "himself", "his", "hk", "hm", "hn", "home", "homepage", "how", "however", "hr", "ht", "htm", "html", "http", "hu", "hundred", "i", "i.e.", "id", "ie", "if", "ii", "il", "ill", "im", "in", "inc", "inc.", "indeed", "information", "instead", "int", "into", "io", "iq", "ir", "is", "isn", "isnt", "it", "its", "itself", "ive", "j", "je", "jm", "jo", "join", "jp", "k", "ke", "kg", "kh", "ki", "km", "kn", "kp", "kr", "kw", "ky", "kz", "l", "la", "last", "later", "latter", "lb", "lc", "least", "length", "less", "let", "lets", "li", "like", "likely", "lk", "ll", "lr", "ls", "lt", "ltd", "lu", "lv", "ly", "m", "ma", "made", "make", "makes", "many", "maybe", "mc", "md", "me", "meantime", "meanwhile", "mg", "mh", "might", "mil", "miss", "mk", "ml", "mm", "mn", "mo", "more", "moreover", "most", "mostly", "mp", "mq", "mr", "mrs", "ms", "msie", "mt", "mu", "much", "must", "mv", "mw", "mx", "my", "myself", "mz", "n", "na", "namely", "nc", "ne", "neither", "net", "netscape", "never", "nevertheless", "new", "next", "nf", "ng", "ni", "nine", "ninety", "nl", "no", "nobody", "none", "nonetheless", "noone", "nor", "not", "nothing", "now", "nowhere", "np", "nr", "nu", "nz", "o", "of", "off", "often", "om", "on", "once", "one", "ones", "only", "onto", "or", "org", "other", "others", "otherwise", "our", "ours", "ourselves", "out", "over", "overall", "own", "p", "pa", "page", "pe", "per", "perhaps", "pf", "pg", "ph", "pk", "pl", "pm", "pn", "pr", "pt", "pw", "py", "q", "qa", "r", "rather", "re", "recent", "recently", "reserved", "ring", "ro", "ru", "rw", "s", "sa", "same", "sb", "sc", "sd", "se", "seem", "seemed", "seeming", "seems", "seven", "seventy", "several", "sg", "sh", "she", "shed", "shell", "shes", "should", "shouldn", "shouldnt", "si", "since", "site", "six", "sixty", "sj", "sk", "sl", "sm", "sn", "so", "some", "somehow", "someone", "something", "sometime", "sometimes", "somewhere", "sr", "st", "still", "stop", "su", "such", "sv", "sy", "sz", "t", "taking", "tc", "td", "ten", "test", "text", "tf", "tg", "th", "than", "that", "thatll", "thats", "the", "their", "them", "themselves", "then", "thence", "there", "thereafter", "thereby", "therefore", "therein", "therell", "theres", "thereupon", "these", "they", "theyd", "theyll", "theyre", "theyve", "thirty", "this", "those", "though", "thousand", "three", "through", "throughout", "thru", "thus", "tj", "tk", "tm", "tn", "to", "together", "too", "toward", "towards", "tp", "tr", "tt", "tv", "tw", "twenty", "two", "tz", "u", "ua", "ug", "uk", "um", "under", "unless", "unlike", "unlikely", "until", "up", "upon", "us", "use", "used", "using", "uy", "uz", "v", "va", "vc", "ve", "very", "vg", "vi", "via", "vn", "vu", "w", "was", "wasn", "wasnt", "we", "web", "wed", "welcome", "well", "were", "weren", "werent", "weve", "wf", "what", "whatever", "whatll", "whats", "when", "whence", "whenever", "where", "whereafter", "whereas", "whereby", "wherein", "whereupon", "wherever", "whether", "which", "while", "whither", "who", "whod", "whoever", "whole", "wholl", "whom", "whomever", "whos", "whose", "why", "width", "will", "with", "within", "without", "won", "wont", "would", "wouldn", "wouldnt", "ws", "www", "x", "y", "ye", "yes", "yet", "you", "youd", "youll", "your", "youre", "yours", "yourself", "yourselves", "youve", "yt", "yu", "z", "za", "zm", "zr"
            ];

        var expStr = stopList.join("|");
        return txt.replace(new RegExp('\\b(' + expStr + ')\\b', 'gi'), ' ')
            .replace(/\s{2,}/g, ' ');
    }

    var stopListApplied = applyStopList(thick_tweet);

    var wordcnt = stopListApplied.replace(/[^\w\s]/g, "").split(/\s+/).reduce(function (map, word) {
        map[word] = (map[word] || 0) + 1;
        return map;
    }, Object.create(null));
    stopListApplied = window.commaKiller(stopListApplied, "both");

    keysSorted = Object.keys(wordcnt).sort(function (a, b) { return wordcnt[a] - wordcnt[b] });
    valuesSorted = Object.keys(wordcnt).sort(function (a, b) { return wordcnt[a] - wordcnt[b] }).map(key => wordcnt[key]);

    const twitterKeys = keysSorted.reverse();
    const twitterValues = valuesSorted.reverse();
    // console.log(twitterKeys);
    // console.log(twitterValues);

    //CONTAINS AN OBJECT WITH KEY VALUE PAIRS OF ALL WORDS FROM ALL TWEETS SORTED APLHABETICALLY
    var twitterObj = Object.fromEntries(twitterKeys.map((_, i) => [twitterKeys[i], twitterValues[i]]));

    //THIS CODE SORTS THE KEYS AND VALUES ORDERED BY HIGHEST FREQUENCY(Value) TO LOWEST
    //KEY = 0, VALUE = 1, as it is an array to get the 7th word's value, it would be: twitterSortedArray[7][1]
    var twitterSortedArray = [];
    for (var word in twitterObj) {
        twitterSortedArray.push([word, twitterObj[word]]);
    }
    twitterSortedArray = twitterSortedArray.filter(e => e !== '');
    twitterSortedArray.sort(function (a, b) {
        return b[1] - a[1];
    });

    var weight = 1337;
    var weightedValues = weightArray(valuesSorted, weight);
    // console.log(weightedValues);
    var weightedWords = {};
    weightedValues.forEach(function (value) {

    });

    // console.log("WEIGHTED WORDS: " + weightedWords);

    sortedKeys = keysSorted.reverse();


    //////////////////////////////// user tags ////////////////////////////

    userTagsWordArray = window.userTags.split(/[ ,]+/);
    userTagsWordArray = userTagsWordArray.filter(e => e !== '');
    console.log("User Tags Word Array:");
    console.log(userTagsWordArray);
    const thick_usertags_words = userTagsWordArray.join(" ");

    var utags_wordcnt = thick_usertags_words.replace(/[^\w\s]/g, "").split(/\s+/).reduce(function (map, word) {
        map[word] = (map[word] || 0) + 1;
        return map;
    }, Object.create(null));

    utags_keysSorted = Object.keys(utags_wordcnt).sort(function (a, b) { return utags_wordcnt[a] - utags_wordcnt[b] });
    utags_valuesSorted = Object.keys(utags_wordcnt).sort(function (a, b) { return utags_wordcnt[a] - utags_wordcnt[b] }).map(key => utags_wordcnt[key]);

    const utagsKeys = utags_keysSorted.reverse();
    const utagsValues = utags_valuesSorted.reverse();
    // console.log(utagsKeys);
    // console.log(utagsValues);

    //CONTAINS AN OBJECT WITH KEY VALUE PAIRS OF ALL WORDS FROM ALL TWEETS SORTED APLHABETICALLY
    var utagsObj = Object.fromEntries(utagsKeys.map((_, i) => [utagsKeys[i], utagsValues[i]]));

    //THIS CODE SORTS THE KEYS AND VALUES ORDERED BY HIGHEST FREQUENCY(Value) TO LOWEST
    //KEY = 0, VALUE = 1, as it is an array to get the 7th word's value, it would be: twitterSortedArray[7][1]
    var utagsSortedArray = [];
    for (var word in utagsObj) {
        utagsSortedArray.push([word, utagsObj[word]]);
    }

    utagsSortedArray.sort(function (a, b) {
        return b[1] - a[1];
    });




    //////////////////////////////// attended activities ///////////////////
    var attendedSortedArray = window.seperateActivities(window.attendedActivities);
    

    ///////////////////////////////// TRIPLE ARRAY DEBUG /////////////////////////////////////
    console.log('%cTwitter Array Sorted: ', 'background: #222; color: #bada55');
    console.log(twitterSortedArray);
    console.log('%cAttended Activities Array Sorted: ', 'background: #222; color: #ff73fd');
    console.log(attendedSortedArray);
    console.log('%cUser Tags Array Sorted:', 'background: #222; color: #1bfad9');
    console.log(utagsSortedArray);
    ///////////////////////////////// WEIGHTING /////////////////////////////////////
    var w_twitterSortedArray = weightArray(twitterSortedArray, twitter_weighting);
    var w_attendedSortedArray = weightArray(attendedSortedArray, att_weighting);
    var w_utagsSortedArray = weightArray(utagsSortedArray, utags_weighting);

    //Merges arrays' frequencies into one huge mega array of all three collections of words with their frequencies, with no duplicates and standardised formatting.
    var tempMergeArray = FourDimensionalArrayMerge(w_attendedSortedArray, w_twitterSortedArray);
    var triMergedArray = FourDimensionalArrayMerge(tempMergeArray, w_utagsSortedArray);
    // console.log(triMergedArray);
    //////////////////////////////// MEGA ARRAY SORTING BY FREQUENCY ////////////////////////////////////////
    triMergedArray.sort(compareSecondColumn);
    //Sorts array by value in second column (frequency)
    function compareSecondColumn(a, b) {
        if (a[1] === b[1]) {
            return 0;
        }
        else {
            return (a[1] > b[1]) ? -1 : 1;
        }
    }
    console.log('TriMergedArray:');

    console.log(triMergedArray);
    ///////////////////////////////// takes all tags from all activities and creates a csv string ////////////////////////////////////////
    const allActivities = window.activities;
    var allActivities_tagString = "";
    console.log("allActivities: ");
    console.log(allActivities);
    allActivities.forEach(function (act) {
        allActivities_tagString = allActivities_tagString.concat(act.tags + ",")
    });
    console.log("String of all activity tags on the site before computation: " + allActivities_tagString);
    allActivities_tagString = allActivities_tagString.replace(/[ ,]+/g, ",");
    allActivities_tagString = allActivities_tagString.toLowerCase();
    allActivities_tagString = allActivities_tagString.replace(/(^\s*,)|(,\s*$)/g, '');

    console.log("String of all activity tags on the site after computation: " + allActivities_tagString);
    //////////////////////////////// FILTERING HUGE ARRAY DOWN TO ONLY INCLUDE WORDS THAT EXIST AS TAGS IN AN ACTIVITY /////////
    triArrayFiltered = [];
    triMergedArray.forEach(function (keyval) {
        if (allActivities_tagString.includes(keyval[0])) {
            triArrayFiltered.push(keyval);
        }
    });
    triArrayFiltered.forEach(function(item, index, object) {
        if (item[0] == '') {
          object.splice(index, 1);
        }
      });
    console.log('%cTriArray Filtered to Activities:', 'background: #222; color: #23bf54')
    console.log(triArrayFiltered);
    /////////////////////////////////// TOP 10 of the FILTERED KEY VALUE PAIRS ARE PUT INTO AN ARRAY /////////////////////////////
    var top10 = []
    window.top10 = top10;
    window.top10 = triArrayFiltered.slice(0, 10);
    console.log('%cTop 10 Recommended Activities for current user: ', 'background: #222; color: #aabbcc')
    console.log(window.top10);
});
function FourDimensionalArrayMerge(array_1, array_2) {
    var newArray = []
    var matchFound = false;
    var mergedVal = null;
    var addedVal = null;
    for (var i = 0; i < array_1.length; i++) {
        for (var j = 0; j < array_2.length; j++) {
            //If Array 1's word is the same as Array 2's...
            if (array_1[i][0].toLowerCase() == array_2[j][0].toLowerCase()) {
                var existFlag2 = false;
                for (var y = 0; y < newArray.length; y++) {
                    if (array_1[i][0].toLowerCase() == newArray[y][0].toLowerCase()) {
                        addedVal = array_1[i][1] + newArray[y][1];
                        newArray[y][1] = addedVal;
                        existFlag2 = true;
                        matchFound = true;
                    }
                }
                if (existFlag2 == false) {
                    matchFound = true;
                    //Add the word frequencies and push new word and frequency to newArray
                    mergedVal = array_1[i][1] + array_2[j][1];
                    newArray.push([array_1[i][0].toLowerCase(), mergedVal]);
                }
            } else {
                //If there was no word match, add the array_2 word and frequency to newArray
                var existFlag = false;
                for (var x = 0; x < newArray.length; x++) {
                    if ([array_2[j][0].toLowerCase()] == newArray[x][0].toLowerCase()) {
                        existFlag = true;
                    }
                }
                if (existFlag == true) {
                    existFlag = false;
                } else {
                    newArray.push([array_2[j][0].toLowerCase(), array_2[j][1]]);
                }
            }
        }
        //This fires after each j iteration
        if (matchFound) {
            //Reset matchFound for next iteration
            matchFound = false;
        } else {
            //If no match was found in array_2 for array_1's word, push the array_1 word and frequency to newArray
            newArray.push([array_1[i][0].toLowerCase(), array_1[i][1]]);
        }
    }
    return newArray;
}
//Removes commas and whitespace from an input string and returns truncated array of words. Parameter = "comma" "whitespace" "both"
window.commaKiller = function commaKiller(inputString, param) {
    if (param == "comma") {
        truncatedString = inputString.split(/[,]+/);
    } else if (param == "whitespace") {
        truncatedString = inputString.split(/[ ]+/);
    } else if (param == "both") {
        truncatedString = inputString.split(/[ ,]+/);
    } else {
        console.log("COMMAKILLER HAS ALREADY THROWN AN ERROR");
    }
    return truncatedString;
}
//Weighting function - takes array of numeric values as input along with a multiplier, then multiplies each value
window.weightArray = function weightArray(array, multiplier) {
    // array[x][0] - selects the x'th member down the list's word
    // array[x][1] - selects the x'th member down the list's frequency
    var ret_array = array;
    for (var i = 0; i < array.length; i++) {
        ret_array[i][1] = array[i][1] * multiplier;
    }
    return ret_array;
};
//Attended Activity to Array seperating function
window.seperateActivities = function seperateActivities(attended) {

    var attendedWordArray = [];
    attended.forEach((activity) => {
        attendedWordArray.push(activity.tags);
    });

    var thick_att_wrd = Array.prototype.join.call(attendedWordArray, " ");
    thick_att_wrd = thick_att_wrd.replace(/,/g, ' ');

    var att_wordcnt = thick_att_wrd.replace(/[^\w\s]/g, "").split(/\s+/).reduce(function (map, word) {
        map[word] = (map[word] || 0) + 1;
        return map;
    }, Object.create(null));


    att_keysSorted = Object.keys(att_wordcnt).sort(function (a, b) { return att_wordcnt[a] - att_wordcnt[b] });
    att_valuesSorted = Object.keys(att_wordcnt).sort(function (a, b) { return att_wordcnt[a] - att_wordcnt[b] }).map(key => att_wordcnt[key]);

    const attendedKeys = att_keysSorted.reverse();
    const attendedValues = att_valuesSorted.reverse();
    // console.log(attendedKeys);
    // console.log(attendedValues);

    //CONTAINS AN OBJECT WITH KEY VALUE PAIRS OF ALL WORDS FROM ALL TWEETS SORTED APLHABETICALLY
    var attendedObj = Object.fromEntries(attendedKeys.map((_, i) => [attendedKeys[i], attendedValues[i]]));

    //THIS CODE SORTS THE KEYS AND VALUES ORDERED BY HIGHEST FREQUENCY(Value) TO LOWEST
    //KEY = 0, VALUE = 1, as it is an array to get the 7th word's value, it would be: twitterSortedArray[7][1]
    var attendedSortedArray = [];
    for (var word in attendedObj) {
        attendedSortedArray.push([word, attendedObj[word]]);
    }

    attendedSortedArray.sort(function (a, b) {
        return b[1] - a[1];
    });



    // console.log("Activity Tag: " + activity.tags);
    return attendedSortedArray;
}