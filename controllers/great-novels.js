/* eslint-disable max-len */
/* eslint-disable no-unused-vars */
const { request } = require('express')
const models = require('../models')

const getAllAuthors = async (request, response) => {
  const authors = await models.authors.findAll()

  return authors
    ? response.send(authors)
    : response.sendStatus(404)
}
const getAuthorById = async (request, response) => {
  const { id } = request.params

  const foundAuthor = await models.authors.findOne({
    where: { id },
    include: [{
      model: models.novels,
      include: [{ model: models.genres }]
    }]
  })

  return foundAuthor
    ? response.send(foundAuthor)
    : response.sendStatus(404)
}

const getAuthorsByIdOrLastName = async (request, response) => {
  const { identifier } = request.params

  const foundAuthor = await models.authors.findOne({
    where: {
      [models.Op.or]: [
        { id: identifier },
        { nameLast: { [models.Op.like]: `%${identifier}%` } },
      ]
    },
    include: [{
      model: models.novels,
      include: [{ model: models.genres }]
    }]
  })

  return foundAuthor
    ? response.send(foundAuthor)
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

  const foundGenre = await models.genres.findOne({
    where: { id },
    include: [{
      model: models.novels,
      include: [{ model: models.authors }]
    }]
  })

  return foundGenre
    ? response.send(foundGenre)
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


const getNovelsByIdOrTitle = async (request, response) => {
  const { identifier } = request.params

  const foundNovel = await models.novels.findOne({
    where: {
      [models.Op.or]: [
        { id: identifier },
        { title: { [models.Op.like]: `%${identifier}%` } },
      ]
    },
    include: [{ model: models.authors }, { model: models.genres }]
  })

  return foundNovel
    ? response.send(foundNovel)
    : response.sendStatus(404)
}





module.exports = {
  getAllAuthors, getAuthorById, getAllGenres, getGenreById, getAllNovels, getNovelById, getAuthorsByIdOrLastName, getNovelsByIdOrTitle
}
