#ifndef COUNTER_H
#define COUNTER_H

#include <QObject>
#include <qqml.h>

class Counter : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int main_count READ main_count WRITE setCount NOTIFY countChanged)
    QML_ELEMENT
public:
    Counter(QObject * parent = 0);
    int main_count() const;
    void setCount(int val);
protected:
signals:
    void countChanged();
private:
    int m_counter;
};

#endif // COUNTER_H
