#include "speak.h"

Speak::Speak(QObject *parent) : QObject(parent)
{

}

void Speak::speak(QString word)
{
    if (!m_mute)
        m_entity.say(word);
}

bool Speak::mute(void)
{
    return m_mute;
}

void Speak::setMute(bool x)
{
    m_mute = x;

    if (m_mute) m_entity.stop();

    emit muteChanged();
}
