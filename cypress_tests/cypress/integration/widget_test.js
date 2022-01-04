/// <reference types="cypress" />

describe('Accordian widget test', () => {
    before(() => {
        cy.visit('https://demoqa.com/accordian')
        cy.get('#section1Heading').click()
    })

    const elementSection = [
        {
            title: 'What is Lorem Ipsum?',
            Content: '#section1Content',
            Heading: '#section1Heading',
            text: 'simply dummy'
         },
         {
            Content: '#section2Content',
            Heading: '#section2Heading',
            title: 'Where does it come from?',
            text: 'Contrary to popular belief'
         },
         {
            Content: '#section3Content',
            Heading: '#section3Heading',
            title: 'Why do we use it?',
            text: 'established fact' 
         }]

    elementSection.forEach((section) => {
        it(`can open accordian ${section.title}`, () => {
            cy.get(section.Heading).click()
            cy.get(section.Content).should('contain', section.text)
        })

        it(`can close accordian ${section.title}`, () => {
            cy.get(section.Heading).click()
            cy.get(section.Content).should('not.be.visible')
        })

    }) 
})