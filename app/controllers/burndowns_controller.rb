class BurndownsController < ApplicationController
  def index
    @totalPoints = 0
    @point = []
	  @stories= Story.all.select{|s| s.project_id == params[:curr_project].to_i}
	  @stories.each do |story|
		  @totalPoints = @totalPoints + story.points
	  end
    @expectedPoints = @totalPoints
	  @point.push(@expectedPoints)

    @pointStage0 = 0
    s = @stories.select{|story| story.stage == 0}
	  s.each do |story|
		  @pointStage0  = @pointStage0  + story.points
	  end
    @totalPoints = @totalPoints - @pointStage0 
	  @point.push(@totalPoints)

    @pointStage1 = 0
	  s = @stories.select{|story| story.stage == 1}
      s.each do |story|
        @pointStage1 = @pointStage1 + story.points
      end
    @totalPoints = @totalPoints- @pointStage1
	  @point.push(@totalPoints)


    @pointStage2 = 0
	  s = @stories.select{|story| story.stage == 2}
      s.each do |story|
        @pointStage2 = @pointStage2 + story.points
      end
    @totalPoints = @totalPoints - @pointStage2
	  @point.push(@totalPoints)


    @pointStage3 = 0
	  s = @stories.select{|story| story.stage == 3}
      s.each do |story|
       @pointStage3 = @pointStage3 + story.points
      end
    @totalPoints = @totalPoints - @pointStage3
	  @point.push(@totalPoints)


    @pointStage4 = 0
	  s = @stories.select{|story| story.stage == 4}
      s.each do |story|
        @pointStage4 = @pointStage4 + story.points
      end
    @totalPoints = @totalPoints- @pointStage4
	  @point.push(@totalPoints)


    @pointStage5 = 0
	  s = @stories.select{|story| story.stage == 5}
      s.each do |story|
        @pointStage5 = @pointStage5 + story.points
      end
    @totalPoints = @totalPoints - @pointStage5
	  @point.push(@totalPoints)

    end
end