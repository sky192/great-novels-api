/* eslint-disable padding-line-between-statements */
const genres = (connection, Sequelize) => {
  return connection.define('genres', {
    id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
    name: { type: Sequelize.STRING, allowNull: false },
  }, {
    defaultScope: {
      attributes: { exclude: ['deletedAt'] }
    }
  }, { paranoid: true })
}
module.exports = genres
