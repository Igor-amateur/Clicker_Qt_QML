#include "counter.h"

Counter::Counter(QObject * parent):
    QObject(parent)
{
    m_counter = 0;
}

int Counter::main_count() const
{
    return  m_counter;
}
void Counter::setCount(int val)
{
    m_counter = val;
    emit countChanged();
}
