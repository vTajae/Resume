#import "vantage-typst.typ": findMe, vantage, term, skill, styled-link, bold_keywords_in_text
#let configuration = yaml("configuration.yaml")

#vantage(

  [

    == #configuration.name

    #configuration.title #h(14%)
    #configuration.address
    #configuration.location


    == Experience


    #for job in configuration.jobs [
      === #job.position \
      _#link(job.company.link)[#job.company.name]_ - #styled-link(job.product.link)[#job.product.name] \
      #term[#job.from --- #job.to][#job.location]

      // Loop through job descriptions and apply bolding logic
      #for point in job.description [
        - #bold_keywords_in_text(point, configuration.keywords)
      ]
    ]

    == Achievements/Certifications

    #for achievement in configuration.achievements [
      === #achievement.name
      \
      #h(1%)#achievement.description
      \
    ]

  ],

  [

    == Tagline

    #configuration.tagline

    == Objective

    #configuration.objective

    == Technical Expertise

    #for expertise in configuration.technical_expertise [
      #skill(expertise.name, expertise.level)
    ]

    == Skills/Exposure

    #for skill in configuration.skills [
      • #skill
    ]

    == Methodology/Approach
    #for method in configuration.methodology [
      • #method
    ]

    == Tools
    #for tool in configuration.tools [
      • #tool
    ]

    == Education

    #for edu in configuration.education [
      === #if edu.place.link != "" [
        #link(edu.place.link)[#edu.place.name]\
      ] else [
        #edu.place.name\
      ]

      #edu.from - #edu.to #h(1fr) #edu.location

      #edu.degree in #edu.major

    ]

  ],
)
