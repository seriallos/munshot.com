
# GET home page.
exports.index = (req, res) ->
  res.render 'index', title: 'Mun Shot'

# GET /craft
exports.craftIndex = ( req, res ) ->
  res.render 'craft/index', title: 'Mun Shot: Crafts'

# POST /craft
exports.craftCreate = ( req, res ) ->
  # validate form
  # create the craft
  # bounce to the new craft page
  res.redirect 'craft/view/123'
