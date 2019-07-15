#include "speak.h"

Speak::Speak(QObject *parent) : QObject(parent)
{

}

void Speak::speak(QString word)
{
    m_entity.say(word);
}
