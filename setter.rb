require 'sinatra'

get '/' do
  erb :form
end

post '/' do
  squat         = params[:squat].to_i
  benchpress    = params[:bench].to_i
  military      = params[:military].to_i
  row           = params[:row].to_i
  deadlift      = params[:deadlift].to_i
  
  @params = params
  
  @weights = Hash.new
  @weights[:squat]      = calculate(squat)      if squat > 0
  @weights[:bench]      = calculate(benchpress) if benchpress > 0
  @weights[:military]   = calculate(military)   if military > 0
  @weights[:row]        = calculate(row)        if row > 0
  @weights[:deadlift]   = calculate(deadlift)   if deadlift > 0

  erb :form
end

private

def calculate(working_weight)  
  sets = 
  [
    { reps: 5, weight: 45 },
    { reps: 5, weight: 45 },
    { reps: 5, weight: nearest_five(working_weight.to_f * 0.4) },
    { reps: 3, weight: nearest_five(working_weight.to_f * 0.6) },
    { reps: 2, weight: nearest_five(working_weight.to_f * 0.8) },
    { reps: 5, weight: working_weight },
    { reps: 5, weight: working_weight },
    { reps: 5, weight: working_weight }
  ]
end

def nearest_five(number)
  (number / 5).round * 5
end