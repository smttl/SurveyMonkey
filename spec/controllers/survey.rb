require_relative '../spec_helper.rb'

describe "SurveyController" do
  let(:user) {User.create(name: "Rayanbouts",password: "yooo")}

  before do
    user
  end

  it 'should redirect to a new survey' do
    get '/surveys/new'
    expect(last_response).to be_ok
    expect(last_response.body).to include("Creating")
  end

  # it 'should create a new survey' do
  #   post '/surveys/create',session[:user_id]=user.id, params= {title:"HelloMonkey", questions:{question1: {title:"", choice1: "hey", choice2: "h", choice3:""}}}
  #   expect(last_response).to be_redirect
  #   follow_redirect!
  #   expect(last_response.body).to include("SuperSurvey")
  # end

  it 'should find the newly created survey' do
    survey = Survey.create(title: "testsurvey", user: user)
    get '/surveys/1'
    expect(last_response).to be_ok
    expect(last_response.body).to include(survey.title)
  end

end

