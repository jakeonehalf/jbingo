#ifndef SPEAK_H
#define SPEAK_H

#include <QObject>
#include <QTextToSpeech>

class Speak : public QObject
{
    Q_OBJECT

    Q_PROPERTY(bool mute READ mute WRITE setMute NOTIFY muteChanged)

public:
    explicit Speak(QObject *parent = nullptr);

    Q_INVOKABLE void speak(QString);

    bool mute(void);
    void setMute(bool x);

signals:
    void muteChanged(void);

public slots:

private:
    bool            m_mute;

    QTextToSpeech   m_entity;
};

#endif // SPEAK_H
