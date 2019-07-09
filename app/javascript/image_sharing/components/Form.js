import React from 'react';

export default class Form extends React.Component {
  render() {
    return (
      <form>
        <div>
          <label htmlFor="name_input">
            Your Name:
            <input type="text" name="name" id="name_input" />
          </label>
        </div>

        <div>
          <label htmlFor="comments_input">
            Comments:
            <input type="text" name="comments" id="comments_input" />
          </label>
        </div>

        <input type="submit" value="Submit" />
      </form>
    );
  }
}
