//
//  Samples.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import Foundation

let dateNow = Date()
let dateMinutesBefore = Date(timeIntervalSinceNow: -123)
let dateHoursBefore = Date(timeIntervalSinceNow: -23123)
let dateDaysBefore = Date(timeIntervalSinceNow: -123123)

let sampleProduct1 = Product(
    id: 0,
    title: "Used Product 1",
    image: "https://picsum.photos/300/300",
    publishedDate: dateNow,
    owner: sampleUser4,
    price: Product.Price(amount: 5.55, locale: Locale.current)
)

let sampleProduct2 = Product(
    id: 1,
    title: "Used Product 2",
    image: "https://picsum.photos/301/301",
    publishedDate: dateMinutesBefore,
    owner: sampleUser4,
    price: Product.Price(amount: 16.89, locale: Locale.current)
)

let sampleProduct3 = Product(
    id: 2,
    title: "Used Product 3",
    image: "https://picsum.photos/302/302",
    publishedDate: dateHoursBefore,
    owner: sampleUser4,
    price: Product.Price(amount: 33.33, locale: Locale.current)
)

let sampleProduct4 = Product(
    id: 2,
    title: "Used Product 4",
    image: "https://picsum.photos/303/303",
    publishedDate: dateDaysBefore,
    owner: sampleUser4,
    price: Product.Price(amount: 33.33, locale: Locale.current)
)

let sampleProduct5 = Product(
    id: 2,
    title: "Used Product 5",
    image: "https://picsum.photos/304/304",
    publishedDate: dateDaysBefore,
    owner: sampleUser4,
    price: Product.Price(amount: 33.33, locale: Locale.current)
)

let sampleProduct6 = Product(
    id: 2,
    title: "Used Product 6",
    image: "https://picsum.photos/305/305",
    publishedDate: dateDaysBefore,
    owner: sampleUser4,
    price: Product.Price(amount: 33.33, locale: Locale.current)
)

let sampleUser1 = User(
    id: 0,
    name: "Ceyhun Akkuas",
    image: "https://media-exp1.licdn.com/dms/image/C4D03AQHJc9xJrS05BQ/profile-displayphoto-shrink_200_200/0?e=1612396800&v=beta&t=DR8qLUgFOCWakWq2wbofyDeVpx-J6OnKf1Pe2CkblMA"
)

let sampleUser2 = User(
    id: 1,
    name: "Yigit Pense",
    image: "https://mir-s3-cdn-cf.behance.net/user/276/191e9714505279.5f12417a0b1bf.png"
)

let sampleUser3 = User(
    id: 2,
    name: "Sedef Zor",
    image: "https://pbs.twimg.com/profile_images/1029754087196291072/Bu3a3sk1_400x400.jpg"
)

let sampleUser4 = User(
    id: 3,
    name: "Ozgun Izmirli",
    image: "https://media-exp1.licdn.com/dms/image/C4E03AQEQer-_s3O_Xg/profile-displayphoto-shrink_200_200/0?e=1612396800&v=beta&t=veT5iEHDcFNe0Wn5Hc46Ap_Ql73zgYGB6-L-UhbCDnI"
)

let sampleMessage1 = Message(id: 0, user: sampleUser1, sentDate: dateNow, product: sampleProduct1, text: "Naber Moruk")
let sampleMessage2 = Message(id: 1, user: sampleUser2, sentDate: dateMinutesBefore, product: sampleProduct2, text: "UTUTUTUTUTUTUTUTUTU")
let sampleMessage3 = Message(id: 2, user: sampleUser3, sentDate: dateDaysBefore, product: sampleProduct3, text: "Ne biliyim ben yaaaaaa")
