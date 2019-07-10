import React from 'react';
import { post } from '../utils/helper';

export default class Form extends React.Component {
  constructor(props) {
    super(props);
    this.state = { name: '', comment: '', message: '' };
  }

  nameInputHandler = (e) => {
    this.setState({
      name: e.target.value
    });
  };

  commentInputHandler = (e) => {
    this.setState({
      comment: e.target.value
    });
  };

  formSubmitHandler() {
    return post('/api/feedbacks', this.state).then((response) => {
      this.setState({ message: response.message });
    }).catch((response) => {
      this.setState({ message: response.data.error });
    }).finally(() => {
      this.setState({ name: '', comment: '' });
    });
  }

  render() {
    return (
      <form onSubmit={(e) => {
        e.preventDefault();
      }}
      >
        <div id="message">
          {this.state.message}
        </div>
        <div>
          <label htmlFor="name_input">
            Your Name:
            <input
              type="text"
              name="name"
              id="name_input"
              value={this.state.name}
              onChange={this.nameInputHandler}
            />
          </label>
        </div>

        <div>
          <label htmlFor="comments_input">
            Comments:
            <input
              type="text"
              name="comments"
              id="comments_input"
              value={this.state.comment}
              onChange={this.commentInputHandler}
            />
          </label>
        </div>

        <input
          type="submit"
          value="Submit"
          onClick={() => this.formSubmitHandler()}
        />
      </form>
    );
  }
}
