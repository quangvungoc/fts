User.create(name: "Admin", email: "admin@example.com", password: "abc123", password_confirmation: "abc123", admin: 1)
(1..40).each do |i| 
  User.create(name: "User#{i}", email: "user#{i}@example.com", password: "abc123", password_confirmation: "abc123")
end

subject_list = [
  "MySQL",
  "MySQL Exercise",
  "Ruby on Rails",
  "Git"
]

subject_list.each do |name|
  Subject.create(name: name)
end

Exam.create(subject_id: 1, name: "MySQL 1", form: "SSSSSSTTTEEE", duration: 20)
Exam.create(subject_id: 1, name: "MySQL 2", form: "SSSSSSSSSSSS", duration: 20)
Exam.create(subject_id: 1, name: "MySQL 3", form: "EEE", duration: 60)
Exam.create(subject_id: 1, name: "MySQL 4", form: "SSSSSSTTTEEE", duration: 50)
Exam.create(subject_id: 2, name: "Exam 2", form: "SSSTTTEEESSS", duration: 20)
Exam.create(subject_id: 3, name: "Exam 3", form: "TTTEEESSSSSS", duration: 20)
Exam.create(subject_id: 4, name: "Exam 4", form: "SSSTTTTSSSS", duration: 20)


sample_text = %w(hi hello bye ohayou konnichiha konbanha arigatou goodnight goodmorning sayounara nippon english england vietnam vietnamese taiyo tsuki hi mizu moku kin go)

type = "T"
(1..50).each do |i|
  subject_id = i%4+1
  content = sample_text.shuffle[0..9].join(" ")
  question_id = Question.create(subject_id: subject_id, question_type: type, content: content).id
  answer = sample_text.shuffle[0..5].join(" ")
  Answer.create(question_id: question_id, content: answer, correct_answer: 1)
end

type = "S"
correct = [1,0,0,0]
(1..50).each do |i|
  subject_id = i%4+1
  content = sample_text.shuffle[0..5].join(" ")
  question_id = Question.create(subject_id: subject_id, question_type: type, content: content).id
  answer = []
  answer[0] = sample_text.shuffle[0..3].join(" ")
  answer[1] = sample_text.shuffle[0..3].join(" ")
  answer[2] = sample_text.shuffle[0..3].join(" ")
  answer[3] = sample_text.shuffle[0..3].join(" ")

  correct.shuffle!

  answer.zip(correct).each do |a,c|
    Answer.create(question_id: question_id, content: a, correct_answer: c)
  end
end

type = "E"
(1..20).each do |i|
  subject_id = i%4+1
  content = sample_text.shuffle[0..15].join(" ")
  question_id = Question.create(subject_id: subject_id, question_type: type, content: content).id
  answer = sample_text.shuffle[0..10].join(" ")
  Answer.create(question_id: question_id, content: answer, correct_answer: 1)
end


#TODO 
=begin

(1..20).each do |i|
  user_id = User.find(i).id
  exam_id = i%4+1
  AnswerSheet.create(user_id: user_id, exam_id: exam_id)
end
=end