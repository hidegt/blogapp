const { environment } = require('@rails/webpacker')

  const webpack = require('webpack')

  environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery/sc/jquery',
    jQuery: 'jquery/src/jquery',
    Propper: ['popper.js', 'default']
  }))

module.exports = environment
