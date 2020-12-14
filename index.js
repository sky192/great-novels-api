/* eslint-disable max-len */
/* eslint-disable no-console */

const express = require('express')
const {
  getAllAuthors, getAuthorById, getAllGenres, getGenreById, getAllNovels, getNovelById, getAuthorsByIdOrLastName, getNovelsByIdOrTitle
} = require('./controllers/great-novels')

const app = express()

app.get('/authors', getAllAuthors)
app.get('/authors/:id', getAuthorById)

app.get('/authors/:identifier', getAuthorsByIdOrLastName)

app.get('/genres', getAllGenres)
app.get('/genres/:id', getGenreById)

app.get('/novels', getAllNovels)
app.get('/novels/:id', getNovelById)
app.get('/novels/:identifier', getNovelsByIdOrTitle)

app.all('*', (request, response) => {
  return response.sendStatus(404)
})

app.listen((1337), () => {
  console.log('Listening to 1337 ...')
})
