User.create(name: "Leo Rogers", password: "12345")
User.create(name: "Rayan Boutaleb", password: "12345")

Survey.create(title: "Favorite City", user_id: 1)
Survey.create(title: "Best Ice Cream", user_id: 2)

Question.create(title: "What's your favorite city?", survey_id: 1)
Question.create(title: "What's your favorite ice cream?", survey_id: 2)

Choice.create(title: "New York", question_id: 1)
Choice.create(title: "Los Angeles", question_id: 1)
Choice.create(title: "Miami", question_id: 1)

Choice.create(title: "Vanilla", question_id: 2)
Choice.create(title: "Chocolate", question_id: 2)
Choice.create(title: "Strawberry", question_id: 2)
