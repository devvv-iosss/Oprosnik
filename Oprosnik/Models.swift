

struct Animals {
    let dog: String
    let cat: String
    let rabbit: String
    let turtle: String
}

extension Animals {
    static func getAnimal() -> Animals {
        Animals(dog: "🐶", cat: "😸", rabbit: "🐰", turtle: "🐢")
    }
}

struct Questions {
    let allQuestions = ["Какую пищу вы предпочитаете?", "Что Вам нравится больше?","Любите ли Вы поездки на машине?"]
}

struct QuestionAnswers {
    let questionAnswers1: [String]
    let questionAnswers2: [String]
    let questionAnswers3: [String]
}
extension QuestionAnswers {
    static func getAnswers() -> QuestionAnswers {
        QuestionAnswers(
            questionAnswers1: ["Cтейк", "Рыба", "Морковь", "Кукуруза"],
            questionAnswers2: ["Спать", "Плавать", "Обниматься", "Есть"],
            questionAnswers3: ["Ненавижу", "Обожаю"]
        )
    }
}

