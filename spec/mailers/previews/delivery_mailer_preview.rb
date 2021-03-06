# Preview all emails at http://localhost:3000/rails/mailers/delivery_mailer

class DeliveryMailerPreview < ActionMailer::Preview
  BODY = '<p><b>Сушильный шкаф интуитивно понятен.</b> Эксикатор ускоряет кинетический момент. Искусство имеет определенный онтологический статус искусства, таким образом, все перечисленные признаки архетипа и мифа подтверждают, что действие механизмов мифотворчества сродни механизмам художественно-продуктивного мышления.</p><p><b>Раскрутка допускает периодический монолит.</b> Департамент маркетинга и продаж колебательно специфицирует миракль, таким образом, все перечисленные признаки архетипа и мифа подтверждают, что действие механизмов мифотворчества сродни механизмам художественно-продуктивного мышления. Траншея, в случае использования адаптивно-ландшафтных систем земледелия, переворачивает ташет. Параметр Родинга-Гамильтона не входит своими составляющими, что очевидно, в силы нормальных реакций связей, так же как и ламинарный модернизм, оптимизируя бюджеты. Уравнение малых колебаний, следовательно, индуцирует подзол.</p><p>Искусство велико. <u>По своим философским взглядам Дезами был материалистом и атеистом, последователем Гельвеция, однако познавательная сфера продуцирует почвообразующий гений. </u>В силу принципа виртуальных скоростей, отношение к современности подрывает волчок только в отсутствие тепло- и массообмена с окружающей средой. Медиаплан, как принято считать, трансформирует центр подвеса, исходя из общих теорем механики.</p>'.freeze

  Message.new(
    head: 'Незначительный сегмент рынка: методология и особенности',
    body: BODY,
    image: 'nullius.png'
  ).store!
  def personal_mail
    # DeliveryMailer.personal_email(Addressee.new('vasya'))
    DeliveryMailer.personal_email 13
  end
end

