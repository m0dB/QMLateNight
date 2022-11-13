#include "librarytablemodel.h"

LibraryTableModel::LibraryTableModel(QObject *parent, const QSqlDatabase &db)
:    QSqlQueryModel(parent)
{
    setQuery("SELECT artist,title,bpm FROM library", db);
    setHeaderData(0,Qt::Horizontal,"Artist");
    setHeaderData(1,Qt::Horizontal,"Title");
    setHeaderData(2,Qt::Horizontal,"BPM");
}
