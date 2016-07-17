class Contact < ApplicationMailer
  def recruit title, contents, giver, file
    if file.present?
      unless file.kind_of?(String)
        file.each do |x|
          attachments[x.original_filename] = x.read
        end
      else
        attachments[file.original_filename] = file.read
      end
    end

    mail subject: title, body: contents, to: ["kwon@trd.st", "joo@trd.st", "contact@trd.st", "jamie@trd.st"], from: giver, attachments: file
  end
end
