const authors = (connection, Sequelize) => {
  return connection.define('authors', {
    id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
    nameFirst: { type: Sequelize.STRING, allowNull: false },
    nameLast: { type: Sequelize.STRING, allowNull: false }
  }, {
    defaultScope: {
      attributes: { exclude: ['deletedAt'] }
    }
  }, { paranoid: true })
}

module.exports = authors
