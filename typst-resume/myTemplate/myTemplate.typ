#import "vantage-typst.typ": findMe, vantage, term, skill, styled-link, format_title , bold_keywords_in_text
#let configuration = yaml("configuration.yaml")

#vantage(

  [
    == #configuration.name #h(15%) #findMe(configuration.direct)
    
    #format_title(configuration.title) \
    #configuration.address #h(1%)
    #configuration.location #h(15%) #findMe(configuration.contacts)



    == Experience

    #for job in configuration.jobs [
      === #job.position \
      _#link(job.company.link)[#job.company.name]_ - #styled-link(job.product.link)[#job.product.name] \
      #term[#job.from --- #job.to][#job.location]


      #for point in job.description [
        - #bold_keywords_in_text(point, configuration.keywords)
      ]
    ]

    == Achievements/Certifications



    #for achievement in configuration.achievements [
      === #achievement.name
      \
      // #h(1%)#achievement.description
      // \
      #bold_keywords_in_text(achievement.description, configuration.keywords)
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

    // #for skill in configuration.skills [
    //   #exposure(skill) \
    // ]


    #let skills = configuration.skills
    #let half = int((skills.len() + 1) / 2)

    #set rect(
      inset: 6pt,
      width: 100%,
      stroke: none,
    )

    #grid(
      columns: (2fr, 2fr),
      rows: (auto),
      gutter: (-4pt),
      rect[ #for skill in skills.slice(0, half) [
          - #skill \
        ]],
      rect[#for skill in skills.slice(skills.len() - half, skills.len()) [
          - #skill \
        ]],
    )





    == Methodology/Approach
    #for method in configuration.methodology [
      • #method \
    ]

    == Tools
    #for tool in configuration.tools [
      • #tool #h(1%)
    ]

    == Education

    #for edu in configuration.education [
      === #if edu.place.link != "" [
        #link(edu.place.link)[#edu.place.name]\
      ] else [
        #edu.place.name\
      ]
      #edu.from - #edu.to #h(1fr) #edu.location\
      #edu.degree in #edu.major

    ]

  ],
)
