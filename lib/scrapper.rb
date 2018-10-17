class  Ville_email
  @@mairies = []
  @@mairie_mails = Hash.new
  def show_mail
    return @@mairie_mails
  end
  def emails(ville)

     doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{ville}.html"))
     doc.css('a.lientxt').each do |link|
      @@mairies.push(link.content.downcase.gsub(/[[:blank:]]/, '-'))
    end
    @@mairies.each { |x| get_the_email_of_a_townhal_from_its_webpage(x) }
  end

  # récupère l'adresse email à partir de l'url d'une mairie, par exemple celle de Vauréal
  def get_the_email_of_a_townhal_from_its_webpage(ml)

               doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{ml}"))
               doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
               @@mairie_mails[ml] = node.text
           end

  end
end
