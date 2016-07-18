class Contact < ApplicationMailer
  def recruit(title, contents, giver, file)
    attachments[file.first.original_filename] = file.first.read if file.present?

    mail(subject: title, body: contents, to: ["kwon@trd.st", "joo@trd.st", "contact@trd.st", "jamie@trd.st"], from: giver, attachments: file)
  end

  def welcome
    mail(subject: 'test', body: 'test', to: 'ogelacinyc@gmail.com')
  end
end
