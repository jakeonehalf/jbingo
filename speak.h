#ifndef SPEAK_H
#define SPEAK_H

#include <QObject>
#include <QTextToSpeech>

class Speak : public QObject
{
    Q_OBJECT
public:
    explicit Speak(QObject *parent = nullptr);

    Q_INVOKABLE void speak(QString);

signals:

public slots:

private:
    QTextToSpeech m_entity;
};

#endif // SPEAK_H
