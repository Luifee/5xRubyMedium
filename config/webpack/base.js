const { webpackConfig, merge } = require('@rails/webpacker')
const customConfig = {
  require('./custom')  
  resolve: {
    extensions: ['.css']
  }
}

module.exports = merge(webpackConfig, customConfig)
