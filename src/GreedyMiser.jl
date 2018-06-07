__precompile__(true)
module GreedyMiser

function greedymiser(xtr::Array{T},ytr::Vector{T},cost::Vector{T},lambda::Float) where T <: Float
    # is data ints? Pretty sure weight will be normalized but X/y could be ints



	# greedy miser code, generating all trees
	
	# input:
	# xtr = n*d, ytr = n*1, 
	# cost = 1*d
	# lambda, scalar
	
	# output:
	# e: all trees
	# options: greedy miser information

	# set params
	options = Dict{String, Float64}()
	options['learningrate']=0.01	# learning rate
	options.depth=4			# CART tree depth
	options.ntrees = 100		# total number of CART trees
	options.verbose = true		# verbose on
	options.computefeaturecosts = @(e) computefeaturecosts(lambda,cost,e) 	# feature cost update function
	# loss function, we have squared loss, logistic loss, squared hinge loss, you can provide your own.
	# gbrt returns ensemble e. 
    [e,l] = gbrt(xtr,@(p)sqrloss(ytr',p),options)	
    
end

include("../utils/computefeaturecosts.jl")
include("../utils/sqrloss.jl")
include("../utils/gbrt")