User.create(name: "Demo Person", password: "password")
User.create(name: "Person Two", password: "123")

Survey.create(title: "Cities", user_id: 1)
Survey.create(title: "Ice Cream", user_id: 2)

Question.create(title: "What's your favorite city", survey_id: 1)
Question.create(title: "What's your favorite ice cream", survey_id: 2)

Choice.create(title: "New York", question_id: 1)
Choice.create(title: "LA", question_id: 1)
Choice.create(title: "Miami", question_id: 1)

Choice.create(title: "Vanilla", question_id: 2)
