/* eslint-disable no-unused-vars */
const Sequelize = require('sequelize')
const allConfigs = require('../config/sequelize')
const authorsModel = require('./authors')
const genresModel = require('./genres')
const novelsModel = require('./novels')
const novelsGenresModel = require('./novelsGenres')

const environment = process.env.NODE_ENV || 'development'
const config = allConfigs[environment]


const connection = new Sequelize(config.database, config.username, config.password, {
  host: config.host, dialect: config.dialect
})


const Authors = authorsModel(connection, Sequelize)
const Genres = genresModel(connection, Sequelize)
const Novels = novelsModel(connection, Sequelize, Authors)
const NovelsGenres = novelsGenresModel(connection, Sequelize, Genres, Novels)

Novels.belongsTo(Authors)
Authors.hasMany(Novels)

Genres.belongsToMany(Novels, { through: NovelsGenres })
Novels.belongsToMany(Genres, { through: NovelsGenres })

module.exports = {
  Authors,
  Genres,
  Novels,
  NovelsGenres,
}
