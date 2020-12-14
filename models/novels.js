const novels = (connection, Sequelize, Authors) => {
  return connection.define('novels', {
    id: { type: Sequelize.INTEGER, autoIncrement: true, primaryKey: true },
    title: { type: Sequelize.STRING, allowNull: false },
    authorId: { type: Sequelize.INTEGER, references: { model: Authors, key: 'id' } },
  }, {
    defaultScope: {
      attributes: { exclude: ['deletedAt'] }
    }
  }, { paranoid: true })
}

module.exports = novels
