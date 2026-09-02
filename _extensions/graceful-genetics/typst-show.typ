#show: doc => graceful-genetics(
$if(title)$
  title: [$title$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
    (
      name: [$it.name.literal$],
      institution: [
$for(it.affiliations/first)$
$if(it.department)$$it.department$, $endif$$it.name$$if(it.city)$, $it.city$$endif$$if(it.country)$, $it.country$$endif$
$endfor$
      ],
      mail: "$it.email$",
    ),
$endfor$
  ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(doi)$
  doi: "$doi$",
$endif$
$if(keywords)$
  keywords: ($for(keywords)$[$it$]$sep$, $endfor$),
$endif$
$if(abstract)$
  abstract: [$abstract$],
$endif$
$if(venue-primary)$
  venue-primary: [$venue-primary$],
$endif$
$if(venue-secondary)$
  venue-secondary: [$venue-secondary$],
$endif$
  doc,
)

