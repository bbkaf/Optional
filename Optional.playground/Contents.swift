//: 什麼是Optional (?)

import UIKit

/*
 Optional 是 Swift 為了避免 nil 造成的 crash 的一個很重要的概念，由於 Swift 是個安全語言，他被設計成所有變數在賦值時只能有值，不能是 nil，為了解決 nil 的問題而導入的概念，在 Swift 中 Optional 是一個 enum，簡單來說就是兩種 case， None: 無值 ； Some: 有值，可以把它想像成一個兩種狀態的黑盒子，盒子裡沒東西與盒子裡有東西。請看以下例子
 
 */

//我們建立一個blackBox，你可以把它想像成一個可以裝String的盒子，而這個盒子可以有兩種狀態，1: 空的； 2: 有裝String。初始化時我們不放任何東西在這個盒子裡面，也就是空的盒子 (Optional.none)，下面的語法很少用，實際上我們都用糖衣語法? 來操作Optional，這邊用它的目的是讓你親自 control + command +滑鼠左鍵點擊他看看，看看apple的api是怎麼描述的
var blackBox: Optional<String> = Optional.none

//第一種狀態：空的黑盒子 (Optional.none)
blackBox = Optional.none

//第二種狀態：有裝String (Optional.some)
blackBox = Optional.some("what is Optional in Swift")


//同樣的一件事換成我們一般常看到形式 ? ，也就是所謂的 Optional 糖衣語法如下，用 String? 取代 Optional<String>
var blackInBoxSugerSyntax: String? = nil

//第一種狀態：空的黑盒子 (Optional.none 也就是 nil)
blackInBoxSugerSyntax = nil  //一個空的黑盒子

//第二種狀態：有裝String (Optional.some("what is Optional in Swift") 也就是 "what is Optional in Swift" )
blackInBoxSugerSyntax = "what is Optional in Swift"


/*這整個把字條放到黑盒子裡的過程稱為 Wrapped，準確來是就是把變數 Optional 化的過程，下一步就是將黑盒子打開，也就是 Unwrapping，而在 Swift 中我們可以用以下五種較常見的方法來做 Unwrapping 這件事：
 第一： !
 第二： if
 第三： if let & Optional chain ?.
 第四： ??
 第五： guard let
 
 這邊先介紹前三項
 */

// 第一： !    這是一種最精簡的方式來做強制解析，意思可以理解為我確定這個黑盒子裡面有東西，把裡面的東西拿出來給我，這個用法要很小心，只有當我們很確定這個Optional有值才可以這麼做，如果該盒子是空的，那麼取出來是nil，接續上面的變數繼續示範。

//第21行所建立的黑盒子，我們在裡面放一個字串
blackInBoxSugerSyntax = "what is Optional in Swift"

//建立一個String type的變數
var note: String = ""

//下面這行出現警告，原因是note這個變數不是Optional，note這個變數不允許nil，他一定要有值，請用 option + 滑鼠左鍵點擊 note 跟 blackInBoxSugerSyntax 看看他們的差異
//note = blackInBoxSugerSyntax

//當我們很確定blackInBoxSugerSyntax這個黑盒子裡面有值時，我們可以用方法1的強制解析 ! ，來取出這個職並付給note如下
note = blackInBoxSugerSyntax!

//那麼如果很不幸，blackInBoxSugerSyntax是空的話呢
blackInBoxSugerSyntax = nil

//可以看到下面直接 crash，因為上述第6行，swift被設計成所有變數在賦值時只能有值，不能是 nil
//let otherNote = blackInBoxSugerSyntax!


//第二： if    if就是如果，如果有值(不等於nil)就...，如果是空(nil)的就...

//如果blackInBoxSugerSyntax不是空的 != nil，則把blackInBoxSugerSyntax強制解析並付值給新變數 otherNot 並輸出，否則輸出 "blackInBoxSugerSyntax is nil"
blackInBoxSugerSyntax = nil
if blackInBoxSugerSyntax != nil {
    //因為blackInBoxSugerSyntax是無值的，才會執行這裡的code，所以可以很有把握的強制解析，此處因為 blackInBoxSugerSyntax = nil 所以不會執行
    let otherNote = blackInBoxSugerSyntax!
    print(otherNote)
} else {
    //因為blackInBoxSugerSyntax是無值的，才會執行這裡的code，此處因為blackInBoxSugerSyntax是無值的，所以會執行以下code
    print("blackInBoxSugerSyntax is nil")
}

//試試把String塞進blackInBoxSugerSyntax這個黑盒子
blackInBoxSugerSyntax = "what is Optional in Swift"
if blackInBoxSugerSyntax != nil {
    //因為blackInBoxSugerSyntax是有值的，才會執行這裡的code，所以可以很有把握的強制解析，此處因為 blackInBoxSugerSyntax != nil 所以會執行
    let otherNote = blackInBoxSugerSyntax!
    print(otherNote)
} else {
     //因為blackInBoxSugerSyntax是無值的，才會執行這裡的code，此處因為blackInBoxSugerSyntax是有值的，所以不會執行以下code
    print("blackInBoxSugerSyntax is nil")
}



//第三： if let & Optional chain  所謂的Optional chain ?. ，意思是如果該盒子有值，就把值取出來付給我們令的變數，並執行以下code，如果該盒子無值則不執行以下code
blackInBoxSugerSyntax = nil
if let otherNote = blackInBoxSugerSyntax?.count {
    //此處因為blackInBoxSugerSyntax是無值的，所以不會執行以下code
    print(otherNote)
}

blackInBoxSugerSyntax = "what is Optional in Swift"
if let otherNote = blackInBoxSugerSyntax?.count {
    //此處因為blackInBoxSugerSyntax是有值的，所以會執行以下code，注意看 option + 滑鼠左鍵看以下otherNote的type。
    print(otherNote)
}


 //第四： ??   雙問號(當然這也是一種糖衣語法)可以理解為如果這個盒子是空的，那就把 ?? 後面的值付給我們令的變數

blackInBoxSugerSyntax = nil
//blackInBoxSugerSyntax = nil，盒子是空的所以把 ?? 後面的值付給 otherNote
let otherNote = blackInBoxSugerSyntax ?? "another note"
print(otherNote)


blackInBoxSugerSyntax = "what is Optional in Swift"
//blackInBoxSugerSyntax != nil，盒子裡有值，所以把值撈出來付給 otherNote2，注意看 option + 滑鼠左鍵看以下otherNote的type。
let otherNote2 = blackInBoxSugerSyntax ?? "another note"
print(otherNote2)


//這邊複習之前提過的三元運算子，也是Swift中唯一的三元運算子   ?  :
blackInBoxSugerSyntax = nil
//(blackInBoxSugerSyntax != nil) 判斷這裡面的條件是 true or false ，true 的話(otherNote3 = 冒號前面的值) otherNote3 = blackInBoxSugerSyntax! ； false 的話 (otherNote3 = 冒號後面的值) otherNote3 = "another note"!
let otherNote3 = (blackInBoxSugerSyntax != nil) ? blackInBoxSugerSyntax! : "another note"
print(otherNote3)


blackInBoxSugerSyntax = "what is Optional in Swift"
//(blackInBoxSugerSyntax != nil) 判斷這裡面的條件是 true or false ，true 的話(otherNote4 = 冒號前面的值) otherNote4 = blackInBoxSugerSyntax! ； false 的話 (otherNote4 = 冒號後面的值) otherNote4 = "another note"!
let otherNote4 = (blackInBoxSugerSyntax != nil) ? blackInBoxSugerSyntax! : "another note"
print(otherNote4)


//最後介紹一些使用情境，如字典，當swift在取字典的值時，取出來的都會是Optional，也就是可能無值。
var dictionary = ["a": "apple",
                  "b": "banana",
                  "c": "cat"]

var lookupDictionary = ""

//第一 !
lookupDictionary = dictionary["a"]!

//第二： if
if dictionary["b"] != nil {
    print(dictionary["b"]!)
}

//第三： if let & Optional chain
if let wordingCount = dictionary["d"]?.count {
    print(wordingCount)
}

if let wordingCount = dictionary["c"]?.count {
    print(wordingCount)
}

//第四： ??
lookupDictionary = dictionary["d"] ?? "door"



