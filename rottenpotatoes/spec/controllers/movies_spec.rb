require 'spec_helper'

describe MoviesController, :type => :controller do
  # Create a dummy table for testing
  before :each do
    movies = [{:title => 'Finding Nemo', :rating => 'G', :release_date => '2003-05-30', :director => ''}, {:title => 'WALL-E', :rating => 'G', :release_date => '2008-06-27', :director => 'Andrew Stanton'}]
    @movies = movies.map { |movie| Movie.create movie } 
  end
  
  # Test table sorting highlight
  describe 'display movies list' do
    context 'when sorting by title is selected' do
      it 'should highlight the title header' do
        get :index, id: @movies, sort: 'title'
        assigns(:title_header).should == 'hilite'
      end
    end
    
    context 'when sorting by release date is selected' do
      it 'should highlight the release date header' do
        get :index, id: @movies, sort: 'release_date'
        assigns(:date_header).should == 'hilite'
      end
    end
  end
    
  # Test the create method
  describe 'create a new movie' do
    it 'should add a new movie in the table' do
      expect{post :create, id: @movies[0]}.to change(Movie, :count).by(1)
    end
    it 'should display a message of success' do
      post :create, id: @movies[1], movie: @movies[1].attributes
      flash[:notice].should =~ /#{@movies[1].title} was successfully created./i
    end
    it 'should redirect to movies page' do
      post :create, id: @movies[0]
      response.should redirect_to movies_path
    end
  end

  # Test the update method
  describe 'edit an existing movie' do
    it 'should modify one or more attributes of movie' do
	  put :update, id: @movies[0], movie: @movies[0].attributes = {director: 'Andrew Stanton'}
	  @movies[0].reload
	  @movies[0].director.should == 'Andrew Stanton'
    end

    it 'should display a message of success' do
	  put :update, id: @movies[0], movie: @movies[0].attributes = {director: 'Andrew Stanton'}
      flash[:notice].should =~ /#{@movies[0].title} was successfully updated./i
    end

    it 'should redirect to details page' do
      put :update, id: @movies[0], movie: @movies[0].attributes = {director: 'Andrew Stanton'}
      response.should redirect_to movie_path(@movies[0])
    end
  end
  
  # Test the destroy method  
  describe 'delete an existing movie' do
    it 'should remove movie from the table' do
      expect{delete :destroy, id: @movies[1]}.to change(Movie, :count).by(-1) 
    end
    it 'should display a message of success' do
      delete :destroy, id: @movies[1]
      flash[:notice].should =~ /Movie '#{@movies[1].title}' deleted./i
    end
    it 'should redirect to movies page' do
      delete :destroy, id: @movies[1]
      response.should redirect_to movies_path
    end
  end
  
  # Testing the similar movies method
  describe 'find movie with same director', pending => true do	
  	context 'when movie has known director' do
	  it 'should redirect to similar movies page' do
	    get :similar_movies, id: @movies[1]
	    response.should redirect_to similar_movies_path(@movies[1])
	  end
    end
    context 'when movie has unknown director' do
      it 'should display a message of failure' do
        get :similar_movies, id: @movies[0]
        flash[:notice].should =~ /'#{@movies[0].title}' has no director info./i
      end
      it 'should redirect to movies page' do
	    get :similar_movies, id: @movies[0]
	    response.should redirect_to movies_path
      end
    end  	
  end
end
