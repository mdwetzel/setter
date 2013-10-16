require 'sinatra'

get '/' do
  erb :form
end

post '/' do
  squat         = params[:squat]
  benchpress    = params[:bench]
  military      = params[:military]
  row           = params[:row]
  deadlift      = params[:deadlift]
  
  @params = params
  
  @weights = {
    squat:    calculate(squat),
    bench:    calculate(benchpress),
    military: calculate(military),
    row:      calculate(row),
    deadlift: calculate(deadlift)
  }
  
  erb :form
end

private

def calculate(working_weight)
  
  weight60 = working_weight * 0.6
  
  sets = 
  [
    { reps: 5, weight: 45 },
    { reps: 5, weight: 45 },
    { reps: 5, weight: working_weight.to_f * 0.4 },
    { reps: 3, weight: working_weight.to_f * 0.6 },
    { reps: 2, weight: working_weight.to_f * 0.8 },
    { reps: 5, weight: working_weight },
    { reps: 5, weight: working_weight },
    { reps: 5, weight: working_weight }
  ]
end