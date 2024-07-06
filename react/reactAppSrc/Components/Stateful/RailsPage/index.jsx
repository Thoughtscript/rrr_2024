'use strict'

/**
 *  RailsPage page.
 *
 *  @Author - Adam InTae Gerard - https://www.linkedin.com/in/adamintaegerard/
 */

import React from 'react'
import UnsplashSection from '../../Presentation/UnsplashSection'
import './RailsPage.css'
import { asyncGet } from '../../../Helpers/Xhr/Get'
import { RAILS_API_URL } from '../../../Constants'

export class RailsPage extends React.Component {
    constructor(props) {
        super(props)
        this.state = {
            examples: [],
            ...this.props
        }
    }

    componentDidMount() {
        // Add IndexDB check here.
        // Check time and empty array.
        try {
            asyncGet(RAILS_API_URL).then(success => {
                const parsed = JSON.parse(success)

                this.setState({
                    examples: (parsed.length > 5) ? parsed.slice(0, 5) : parsed
                })
            })
        } catch (ex) {
            console.log(ex)
        }
    }

    render() {
        const { examples } = this.state

        return (
            <main className="landingPage">
                <UnsplashSection photo={'1591858219137-84737f6e8a67'} ixid={'eyJhcHBfaWQiOjEyMDd9'} />

                <div className="content">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                            </tr>
                        </thead>
                        <tbody>
                            {
                                (examples).map(p =>
                                    <tr key={p.id}>
                                        <th>{p.id}</th>
                                        <th>{p.name}</th>
                                    </tr>
                                )
                            }
                        </tbody>
                    </table>
                </div>
            </main>
        )
    }
}