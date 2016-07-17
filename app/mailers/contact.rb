class Contact < ApplicationMailer
  def recruit title, contents, giver, file
        unless file.nil?
          unless file.kind_of?(String)
            file.each do |x|
              attachments[x.original_filename] = x.read
            end
          else
              attachments[file.original_filename] = file.read
          end
        end

         mail subject: title,
             body: contents,
             to: 'anjella6636@gmail.com',
             from: giver,
             attachments: file
    end
end
