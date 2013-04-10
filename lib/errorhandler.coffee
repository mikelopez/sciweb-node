#
# * error handlers
#

module.exports =
  logErrors: (err, req, res, next) ->
    # std or other error handling
    console.log err.stack
    next err

  clientErrorHandler: (err, req, res, next) ->
    # log xhr error handling
    if req.xhr
      res.send 500,
        error: "Something went cacita"
        
    else
      next err
    
  errorHandler: (err, req, res, next) ->
    # catchall
    res.status 500
    res.render "error",
      error: err



