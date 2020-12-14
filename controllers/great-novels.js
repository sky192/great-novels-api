/* eslint-disable max-len */
/* eslint-disable no-unused-vars */
const models = require('../models')
const Op = require('Sequelize').Op

const getAllAuthors = async (request, response) => {
  const authors = await models.Authors.findAll()

  return authors
    ? response.send(authors)
    : response.sendStatus(404)
}


const getAuthorsByIdOrLastName = async (request, response) => {
  const { identifier } = request.params

  const foundAuthor = await models.Authors.findOne({
    where: {
      [Op.or]: [
        { id: identifier },
        { nameLast: { [Op.like]: `%${identifier}%` } },
      ]
    },
    include: [{
      model: models.Novels,
      include: [{ model: models.Genres }]
    }]
  })

  return foundAuthor
    ? response.send(foundAuthor)
    : response.sendStatus(404)
}
const getAllGenres = async (request, response) => {
  const genres = await models.Genres.findAll()

  return genres
    ? response.send(genres)
    : response.sendStatus(404)
}
const getGenreById = async (request, response) => {
  const { id } = request.params

  const foundGenre = await models.Genres.findOne({
    where: { id },
    include: [{
      model: models.Novels,
      include: [{ model: models.Authors }]
    }]
  })

  return foundGenre
    ? response.send(foundGenre)
    : response.sendStatus(404)
}
const getAllNovels = async (request, response) => {
  const novels = await models.Novels.findAll({
    include: [
      { model: models.Authors },
      { model: models.Genres },
    ]
  })

  return novels
    ? response.send(novels)
    : response.sendStatus(404)
}


const getNovelsByIdOrTitle = async (request, response) => {
  const { identifier } = request.params

  const foundNovel = await models.Novels.findOne({
    where: {
      [Op.or]: [
        { id: identifier },
        { title: { [Op.like]: `%${identifier}%` } },
      ]
    },
    include: [{ model: models.Authors }, { model: models.Genres }]
  })

  return foundNovel
    ? response.send(foundNovel)
    : response.sendStatus(404)
}





module.exports = {
  getAllAuthors, getAllGenres, getGenreById, getAllNovels, getAuthorsByIdOrLastName, getNovelsByIdOrTitle
}
