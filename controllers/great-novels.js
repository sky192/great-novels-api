/* eslint-disable no-unused-vars */
const models = require('../models')

const getAllAuthors = async (request, response) => {
  const authors = await models.authors.findAll()

  return authors
    ? response.send(authors)
    : response.sendStatus(404)
}
const getAuthorById = async (request, response) => {
  const { id } = request.params
  const result = await models.authors.findOne({
    where: { id },
    include: [{
      model: models.Novels,
      include: [{ model: models.genres }]
    }]
  })

  return result
    ? response.send(result)
    : response.sendStatus(404)
}

const getAllGenres = async (request, response) => {
  const genres = await models.genres.findAll()

  return genres
    ? response.send(genres)
    : response.sendStatus(404)
}
const getGenreById = async (request, response) => {
  const { id } = request.params
  const genre = await models.genres.findOne({
    where: { id },
    include: [{
      model: models.novels,
      include: [{ model: models.Authors }]
    }]
  })

  return genre
    ? response.send(genre)
    : response.sendStatus(404)
}
const getAllNovels = async (request, response) => {
  const novels = await models.novels.findAll({
    include: [
      { model: models.authors },
      { model: models.genres },
    ]
  })

  return novels
    ? response.send(novels)
    : response.sendStatus(404)
}
const getNovelById = async (request, response) => {
  const { id } = request.params
  const novel = await models.novels.findOne({
    where: { id },
    include: [
      { model: models.authors },
      { model: models.genres },
    ]
  })

  return novel
    ? response.send(novel)
    : response.sendStatus(404)
}










module.exports = {
  getAllAuthors, getAuthorById, getAllGenres, getGenreById, getAllNovels, getNovelById
}
