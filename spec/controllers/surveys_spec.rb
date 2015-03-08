require 'spec_helper'

describe "Survey Controller" do
  let(:survey_params) {
      Survey.create(title: "Demo")
      Question.create(title: "Hello", survey_id: 1)
      Choice.create(title: "Choice 1", question_id: 1)
      Choice.create(title: "Choice 2", question_id: 1)
  }
  let(:survey) {Survey.create(survey_params)}

  describe "GET /surveys/new" do
    it "loads the new survey form" do
      get '/surveys/new'
      expect(last_response).to be_ok
  end
end

describe "GET /surveys/:id" do
    it "loads the survey with that id" do
      get "/surveys/#{survey.id}"
      expect(last_response).to be_ok
  end
end

describe "GET /surveys/:id/stats" do
    it "loads the specific survey stats page " do
      get "/surveys/#{survey.id}/stats"
      expect(last_response).to be_ok
  end
end

describe "POST /surveys/create" do
    it "creates a new survey " do
      post "/surveys/create", params={survey:{Survey.create(survey_params)}
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
  end
end

describe "GET /surveys/:id/edit" do
    it "loads the survey edit form" do
      get "/surveys/#{survey.id}/edit"
      expect(last_response).to be_ok
      expect(last_response.body).to include("Edit Survey")
  end
end

describe "DELETE /surveys/:id" do
    it "deletes the specific survey" do
      delete "/surveys/#{survey.id}"
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
  end
 end
end
